Rails.application.routes.draw do

  devise_for :user, :path_names => {:sign_in => 'login'} 
  root to: "home#top"
  get 'home/top'
  get 'home/help'  
  resources :users
  namespace :user do
    resources :speeches do 
      resources :likes, only: [:create, :destroy]
      resources :comments, only: [:create, :destroy]
    end  
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
