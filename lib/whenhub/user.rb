require 'virtus'

module WhenHub
  class User
    include Virtus.model

    attribute :displayName, String
    attribute :photo, String
    attribute :login, Time
    attribute :twoFactor, Boolean
    attribute :username, String
    attribute :id, String
    attribute :createdAt, Time
    attribute :updatedAt, Time
    attribute :schedulesFollowed, Array

    attr_accessor :client

    def self.build(client, attributes)
      new(attributes).tap do |schedule|
        schedule.client = client
      end
    end
  end
end
