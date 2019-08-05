Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :logs
      resources :actions
      resources :evaluations
      resources :measurements
      resources :species
      resources :plants
      resources :groups
      resources :users

      post "/login", to: "auth#login"
      get "/auto_login", to: "auth#auto_login"
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
