require 'whenhub/version'
require 'whenhub/client'

module WhenHub
  def self.client(access_token:)
    WhenHub::Client.new(access_token: access_token)
  end
end
