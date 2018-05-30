Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users
  resources :languages
  resources :jobs

  root 'users#welcome', as: "welcome"

   get "signup", to: "users#new", as: "signup"
   get "login", to: "sessions#new", as: "login"
   post "sessions", to: "sessions#create", as: "sessions"
   post "logout", to: "sessions#destroy", as: "logout"

end
