Rails.application.routes.draw do
  get 'home/index'
  devise_for :users
  resources :users, :only => [:show]
  authenticated :user do
    root 'home#index', as: 'authenticated_root'
  end
  devise_scope :user do
    root 'devise/sessions#new'
  end
  
  resources :reviews
  resources :hikes
  
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
