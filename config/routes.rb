Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  post "api/test", to: "application#test"

  namespace :api, defaults: { format: :json } do
    resources :users, only: :create
    resources :products, only: [:index, :show]
    resource :session, only: [:show, :create, :destroy]
    resources :carts, only: [:index, :create, :show, :update, :destroy]
    resources :favorites, only: [:index, :create, :show, :destroy]
  end

  get "*path", to: "static_pages#frontend_index"

end
