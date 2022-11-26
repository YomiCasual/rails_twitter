Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get "about-us", to: "about#index", as: :about
  
  get "sign_up", to: "registrations#new", as: :sign_up
  post "sign_up", to: "registrations#create"
  get "login", to: "registrations#login"
  post "login", to: "registrations#login_user"
  delete "logout", to: "sessions#destroy"

#   Pasowrd
  get "edit_password", to: "passwords#edit"
  patch "edit_password", to: "passwords#edit_password" 

	#   omni-auth
  get "auth/twitter/callback", to: "omniauth_callbacks#twitter"

  resources :twitter
  resources :tweets
  
  root to: 'main#index'
end
