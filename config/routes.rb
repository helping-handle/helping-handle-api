Rails.application.routes.draw do
  defaults format: :json do
    resources :resources
    resources :donations
    resources :favorites
    resources :categories
    resources :goals
    devise_for :users, controllers: {sessions: 'sessions'}
    devise_scope :user do
        get 'users/current', to: 'sessions#show'
    end
  end
end
