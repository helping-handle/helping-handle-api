Rails.application.routes.draw do
  defaults format: :json do
    resources :goals
    devise_for :users
  end
end
