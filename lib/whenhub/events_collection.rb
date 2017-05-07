module WhenHub
  class EventsCollection
    def initialize(client, schedule)
      @client = client
      @schedule = schedule
    end

    def all
      @client.get("/api/users/me/schedules/#{@schedule.id}/events").map do |attributes|
        Event.build(@client, @schedule, attributes)
      end
    end

    def build(attributes = {})
      Event.build(@client, @schedule, attributes)
    end

    def create(attributes = {})
      build(attributes).tap(&:save)
    end
  end
end
