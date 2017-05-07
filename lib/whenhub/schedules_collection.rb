module WhenHub
  class SchedulesCollection
    def initialize(client)
      @client = client
    end

    def all
      @client.get('/api/users/me/schedules').map do |attributes|
        Schedule.build(@client, attributes)
      end
    end

    def find(schedule_id, media: false)
      params = {
        'filter[include][events]' => ['media'],
        'filter[include]' => ['media']
      }

      attributes = @client.get("/api/users/me/schedules/#{schedule_id}", params)
      Schedule.build(@client, attributes)
    end

    def build(attributes = {})
      Schedule.build(@client, attributes)
    end

    def create(attributes = {})
      build(attributes).tap(&:save)
    end
  end
end
