Rails.application.routes.draw do
  get 'home/index'
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  resources :users, :only => [:show]
  authenticated :user do
    root 'home#index', as: 'authenticated_root'
  end
  devise_scope :user do
    root 'devise/sessions#new'
  end
 
  
  
  resources :hikes do 
    resources :reviews
  end
  
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
