Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users
  resources :languages
  resources :jobs, except: [:create, :new, :show]

  root 'users#welcome', as: "welcome"

   get "signup", to: "users#new", as: "signup"
   get "login", to: "sessions#new", as: "login"
   post "sessions", to: "sessions#create", as: "sessions"
   post "logout", to: "sessions#destroy", as: "logout"

   get "jobs/search", to: "jobs#search", as: "search"
   post "jobs", to: "jobs#results", as: "results"
   # get "jobs/results", to: "jobs#results", as: "results"
   # post "jobs/results", to: "jobs#results", as: "post_results"

end
