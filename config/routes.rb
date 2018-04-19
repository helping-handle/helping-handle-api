Rails.application.routes.draw do
  resources :favorites
  resources :categories
  resources :goals, defaults: {format: :json}
  devise_for :users
end
