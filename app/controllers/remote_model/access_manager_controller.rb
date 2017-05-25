module RemoteModel
  class AccessManagerController < ApplicationController
    def response_manager
      model_name = params[:model_name]
      method_name = params[:method_name]
      arguments = params[:arguments]
      attribute_name = params[:attribute_name]
      if model_name.present? and method_name.present? and arguments.present? and attribute_name.present?
        object = model_name.constantize.send method_name, arguments rescue nil
        attribute_value = object.send attribute_name if object.present?
      end
      render :plain => attribute_value, :status => 200
    end
  end
end
