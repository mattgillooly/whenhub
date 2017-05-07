require 'active_model'

module WhenHub
  class Event
    include ActiveModel::Model

    attr_accessor :when, :name, :description, :icon, :location, :resources,
      :priority, :draft, :tags, :order, :customFieldData, :id, :userId,
      :createdAt, :updatedAt, :createdBy, :updatedBy, :scheduleId

    attr_accessor :client

    def self.build(client, schedule, attributes)
      new(attributes).tap do |event|
        event.client = client
        event.scheduleId = schedule.id
      end
    end

    def save
      assign_attributes(
        @client.post(
          "/api/users/me/schedules/#{scheduleId}/events",
          writeable_attributes
        ).first
      )
    end

    def writeable_attributes
      {
        when: self.when,
        name: name,
        description: description,
        scheduleId: scheduleId
      }
    end

    def delete
      @client.delete("/api/events/#{id}")
    end
  end
end
