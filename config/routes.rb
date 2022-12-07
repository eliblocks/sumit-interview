Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  mount Plutus::Engine => "/plutus", :as => "plutus"

  resources :entities

  resource :home, only: :show, controller: 'home'

  # Defines the root path route ("/")
  root "home#show"
end
