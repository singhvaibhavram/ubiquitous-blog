Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'pages#home'
  get 'about', to: 'pages#about'

  # All Article Routes
  resources :articles

  # User Signup Page and Login Page
  get 'signup', to: 'users#new'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  # All User Routes except Sugnup and Login
  resources :users, except: [:new]

  #User Create Post Method
  #post 'users', to: 'users#create'
end
