require 'active_model'

module WhenHub
  class User
    include ActiveModel::Model

    attr_accessor :name, :displayName, :photo, :login, :twoFactor, :username,
      :id, :createdAt, :updatedAt, :schedulesFollowed

    attr_accessor :client

    def self.build(client, attributes)
      new(attributes).tap do |schedule|
        schedule.client = client
      end
    end
  end
end
