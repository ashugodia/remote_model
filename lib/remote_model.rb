require "remote_model/version"
require "rails"
require "active_support/dependencies"
require "httparty"
require "remote_model/engine"
require "remote_model/config"

module RemoteModel
  # Your code goes here...
  def self.access argument
    entities = Array.new
    entities = argument.split('.') if argument.present?
    model_name = entities[0]
    method_name = entities[1].split("\(").first if entities[1].present?
    arguments = entities[1].split("\(").last.split("\)").first if entities[1].present?
    attribute_name = entities[2]
    if model_name.present? and method_name.present? and arguments.present? and attribute_name.present?
      url = RemoteModel.remote_url + '/remote_model?model_name=' + model_name + '&method_name=' + method_name + '&arguments=' + arguments + '&attribute_name=' + attribute_name
      response = HTTParty.get(url) rescue nil
      response = response.body if response.present? and response.body.present?
    end
    return response
  end
end
