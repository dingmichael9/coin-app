Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  get "/register", to: "users#new"
  post "/register", to: "users#create"

  root "users#show"

  resources :users, only: [:index]
  resources :transactions
end
