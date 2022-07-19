Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # resources :surplus, only: [:new, :index, :create]
  get 'surpluses', to: 'surpluses#index', as: :surpluses
  get 'surpluses/new', to: 'surpluses#new', as: :new_surplus
  post 'surpluses', to: 'surpluses#create'
end
