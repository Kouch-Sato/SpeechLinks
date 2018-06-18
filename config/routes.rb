Rails.application.routes.draw do

  devise_for :users
  root to: "home#top"
  get 'home/top'
  namespace :user do
    resources :articles
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
