Rails.application.routes.draw do
  resources :goals, defaults: {format: :json}
  devise_for :users
end
