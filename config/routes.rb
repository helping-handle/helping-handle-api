Rails.application.routes.draw do
  defaults format: :json do
    resources :goals,       only: [:index, :show]
    resources :resources,   only: [:index, :show]
    resources :donations,   only: [:create]
    resources :users,       only: [:index, :show]

    authenticate :user do
      resources :goals,     only: [:create, :update, :destroy]
      resources :resources, only: [:create, :update, :destroy]
      resources :donations, only: [:update, :show]
      resources :favorites
      resources :users, only: [:update] do
        resources :goals, only: [:index]
      end
      patch 'goals/:id/toggle_favorite', to: 'goals#toggle_favorite'
    end

    devise_for :users, path: 'auth/', controllers: {sessions: 'sessions', registrations: 'registrations' }
    devise_scope :user do
      get 'auth/current', to: 'sessions#show'
    end
  end
end
