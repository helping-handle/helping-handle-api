Rails.application.routes.draw do
  defaults format: :json do
    resources :resources
    resources :donations
    resources :favorites
    resources :categories

    devise_for :users, path: 'auth/', controllers: {sessions: 'sessions'}
    devise_scope :user do
      get 'auth/current', to: 'sessions#show'
    end
  end
end
