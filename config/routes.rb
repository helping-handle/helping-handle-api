Rails.application.routes.draw do
  defaults format: :json do
    resources :resources
    resources :donations, only: [:index, :show, :update, :destroy]
    resources :categories
    resources :goals, only: [:index]
    resources :users, only: [:index, :show, :update] do
      resources :goals, shallow: true
    end

    authenticate :user do
      resources :favorites
    end

    patch 'goals/:id/toggle_favorite', to: 'goals#toggle_favorite'

    devise_for :users, path: 'auth/', controllers: {sessions: 'sessions', registrations: 'registrations' }
    devise_scope :user do
      get 'auth/current', to: 'sessions#show'
    end
  end
end
