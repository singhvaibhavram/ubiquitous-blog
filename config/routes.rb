Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'pages#home'
  get 'about', to: 'pages#about'

  # All Article Routes
  resources :articles

  # User Signup Page
  get 'signup', to: 'users#new'
  # All User Routes except new
  resources :users, except: [:new]
  #User Create Paot Method
  #post 'users', to: 'users#create'
end
