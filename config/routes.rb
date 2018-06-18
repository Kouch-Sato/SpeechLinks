Rails.application.routes.draw do

  get 'home/top'
  namespace :user do
    resources :articles
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
