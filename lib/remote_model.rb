require "remote_model/version"
require "rails"
require "active_support/dependencies"
require "httparty"
require "remote_model/engine"
require "remote_model/config"

module RemoteModel
  # Your code goes here...
  def self.access argument
    entities = argument.split('.')
    model_name = entities[0]
    method_name = entities[1].split("\(").first
    arguments = entities[1].split("\(").last.split("\)").first
    attribute_name = entities[2]
    
    url = RemoteModel.remote_url + '/remote_model?model_name=' + model_name + '&method_name=' + method_name + '&arguments=' + arguments + '&attribute_name=' + attribute_name
    response = HTTParty.get(url)
    return response.body
  end
end
