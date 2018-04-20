Rails.application.routes.draw do
  defaults format: :json do
    resources :resources
    resources :donations
    resources :favorites
    resources :categories

    resources :users, only: [:index, :show, :update] do
      resources :goals, shallow: true
    end
    resources :goals, only: [:index]

    devise_for :users, path: 'auth/', controllers: {sessions: 'sessions'}
    devise_scope :user do
      get 'auth/current', to: 'sessions#show'
    end
  end
end
