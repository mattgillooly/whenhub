require 'active_model'

module WhenHub
  class Schedule
    include ActiveModel::Model

    attr_accessor :calendar, :name, :description, :curator, :scope, :viewCode,
    :tags, :id, :userId, :createdAt, :updatedAt, :createdBy, :updatedBy

    attr_accessor :client

    def self.build(client, attributes)
      new(attributes).tap do |schedule|
        schedule.client = client
      end
    end

    def save
      assign_attributes(
        @client.post(
          '/api/users/me/schedules',
          writeable_attributes
        )
      )
    end

    def writeable_attributes
      {
        name: name,
        description: description,
        scope: scope
      }
    end

    def delete
      @client.delete("/api/schedules/#{id}")
    end

    def events
      EventsCollection.new(client, self)
    end
  end
end
