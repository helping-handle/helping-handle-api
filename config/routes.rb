Rails.application.routes.draw do
  resources :categories
  resources :goals, defaults: {format: :json}
  devise_for :users
end
