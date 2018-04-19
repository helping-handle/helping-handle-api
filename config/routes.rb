Rails.application.routes.draw do
  defaults format: :json do
    resources :resources
    resources :donations
    resources :favorites
    resources :categories
    resources :goals
    devise_for :users
  end
end
