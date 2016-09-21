Rails.application.routes.draw do
  get 'users/index'

  #get 'welcome/index'
  #root 'welcome#index'
  devise_for :users
  resources :posts do
  	resources :comments
  end
  root 'posts#index'
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :relationships,       only: [:create, :destroy]
  get '/about', to: 'pages#about'
end
