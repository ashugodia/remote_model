Rails.application.routes.draw do
  get 'remote_model' => 'remote_model/access#result'
end
