Rails.application.routes.draw do
  #get 'welcome/index'
  #root 'welcome#index'
  devise_for :users
  resources :posts do
  	resources :comments
  end
  root 'posts#index'
end
