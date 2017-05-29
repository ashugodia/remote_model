module RemoteModel
  class AccessManagerController < ApplicationController
    def response_manager
      if RemoteModel.auth_key == params[:auth_key]
        attribute_value = eval(params[:query]) rescue nil
      end
      render :plain => attribute_value, :status => 200
    end
  end
end
