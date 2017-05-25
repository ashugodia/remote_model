module RemoteModel
  class AccessManagerController < ApplicationController
    def response_manager
      model_name = params[:model_name]
      method_name = params[:method_name]
      arguments = params[:arguments]
      attribute_name = params[:attribute_name]
      object = model_name.constantize.send method_name, arguments
      attribute_value = object.send attribute_name
      render :plain => attribute_value, :status => 200
    end
  end
end
