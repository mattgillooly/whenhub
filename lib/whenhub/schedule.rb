require 'virtus'

module WhenHub
  class Schedule
    include Virtus.model

    attribute :calendar, Hash
    attribute :name, String
    attribute :description, String
    attribute :curator, String
    attribute :scope, String
    attribute :viewCode, String
    attribute :tags, Array
    attribute :id, String
    attribute :userId, String
    attribute :createdAt, Time
    attribute :updatedAt, Time
    attribute :createdBy, String
    attribute :updatedBy, String

    attr_accessor :client

    def self.build(client, attributes)
      new(attributes).tap do |schedule|
        schedule.client = client
      end
    end

    def save
      self.attributes = @client.post(
        '/api/users/me/schedules',
        writeable_attributes
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
