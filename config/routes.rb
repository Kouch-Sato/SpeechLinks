Rails.application.routes.draw do

  devise_for :user, :path_names => {:sign_in => 'login'}
  root to: "home#top"
  get 'home/top'
  get 'home/help'
  get 'home/privacy'
  get 'home/terms'
  resources :users
  namespace :user do
    resources :notifications, only: [:index, :show]
    resources :speeches do
      resources :likes, only: [:create, :destroy, :index]
      resources :comments, only: [:create, :destroy]
    end
  end

  namespace :admin do
    resources :likes, only: [:index]
    resources :users, only: [:index]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
