Rails.application.routes.draw do
  get 'remote_model' => 'remote_model/access_manager#response_manager'
end
