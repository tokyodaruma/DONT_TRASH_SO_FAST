Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  namespace :lister do
    resources :bookings
    # equivalent to => get ‘/lister/bookings’, to: ‘lister/bookings#index’
    resources :surpluses
  end
  # # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :surpluses, only: %i[index show new create] do
    resources :bookings, only: %i[create update]
  end
  resources :bookings, only: %i[index]
end
