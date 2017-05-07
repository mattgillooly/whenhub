require 'whenhub/user'
require 'whenhub/schedules_collection'
require 'whenhub/schedule'
require 'whenhub/events_collection'
require 'whenhub/event'

require 'rest-client'
require 'json'

module WhenHub
  class Client
    RESOURCE = RestClient::Resource.new('https://api.whenhub.com')

    def initialize(access_token:)
      @access_token = access_token
    end

    def me
      User.build(self, get('/api/users/me'))
    end

    def schedules
      SchedulesCollection.new(self)
    end

    def get(path, params={})
      JSON.parse(nested_resource(path).get(params: params))
    end

    def post(path, params={})
      JSON.parse(nested_resource(path).post(params))
    end

    def delete(path)
      JSON.parse(nested_resource(path).delete)
    end

    private

    def nested_resource(path)
      RESOURCE[path + "?access_token=#{@access_token}"]
    end
  end
end
