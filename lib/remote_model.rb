require "remote_model/version"
require "rails"
require "active_support/dependencies"
require "httparty"
require "remote_model/engine"
require "remote_model/config"

module RemoteModel
  def self.access argument
     url = RemoteModel.remote_url + '/remote_model?auth_key=' + RemoteModel.auth_key + '&query=' + argument
     url = URI.encode(url)
     response = HTTParty.get(url) rescue nil
     response = response.body if response.is_a? HTTParty::Response
     return response
  end
end
