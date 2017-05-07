require 'virtus'

module WhenHub
  class Event
    include Virtus.model

    attribute :when, Hash
    attribute :name, String
    attribute :description, String
    attribute :icon, String
    attribute :location, Hash
    attribute :resources, Array
    attribute :priority, String
    attribute :draft, Boolean
    attribute :tags, Array
    attribute :order, Integer
    attribute :customFieldData, Hash
    attribute :id, String
    attribute :userId, String
    attribute :createdAt, Time
    attribute :updatedAt, Time
    attribute :createdBy, String
    attribute :updatedBy, String
    attribute :scheduleId, String

    attr_accessor :client

    def self.build(client, schedule, attributes)
      new(attributes).tap do |event|
        event.client = client
        event.scheduleId = schedule.id
      end
    end

    def save
      self.attributes = @client.post(
        "/api/users/me/schedules/#{scheduleId}/events",
        writeable_attributes
      ).first
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
