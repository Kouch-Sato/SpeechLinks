# == Route Map
#
#                   Prefix Verb   URI Pattern                                      Controller#Action
#         new_user_session GET    /user/login(.:format)                            devise/sessions#new
#             user_session POST   /user/login(.:format)                            devise/sessions#create
#     destroy_user_session DELETE /user/sign_out(.:format)                         devise/sessions#destroy
#        new_user_password GET    /user/password/new(.:format)                     devise/passwords#new
#       edit_user_password GET    /user/password/edit(.:format)                    devise/passwords#edit
#            user_password PATCH  /user/password(.:format)                         devise/passwords#update
#                          PUT    /user/password(.:format)                         devise/passwords#update
#                          POST   /user/password(.:format)                         devise/passwords#create
# cancel_user_registration GET    /user/cancel(.:format)                           devise/registrations#cancel
#    new_user_registration GET    /user/sign_up(.:format)                          devise/registrations#new
#   edit_user_registration GET    /user/edit(.:format)                             devise/registrations#edit
#        user_registration PATCH  /user(.:format)                                  devise/registrations#update
#                          PUT    /user(.:format)                                  devise/registrations#update
#                          DELETE /user(.:format)                                  devise/registrations#destroy
#                          POST   /user(.:format)                                  devise/registrations#create
#                     root GET    /                                                home#top
#                 home_top GET    /home/top(.:format)                              home#top
#                home_help GET    /home/help(.:format)                             home#help
#             home_privacy GET    /home/privacy(.:format)                          home#privacy
#               home_terms GET    /home/terms(.:format)                            home#terms
#                    users GET    /users(.:format)                                 users#index
#                          POST   /users(.:format)                                 users#create
#                 new_user GET    /users/new(.:format)                             users#new
#                edit_user GET    /users/:id/edit(.:format)                        users#edit
#                     user GET    /users/:id(.:format)                             users#show
#                          PATCH  /users/:id(.:format)                             users#update
#                          PUT    /users/:id(.:format)                             users#update
#                          DELETE /users/:id(.:format)                             users#destroy
#       user_notifications GET    /user/notifications(.:format)                    user/notifications#index
#        user_notification GET    /user/notifications/:id(.:format)                user/notifications#show
#        user_speech_likes GET    /user/speeches/:speech_id/likes(.:format)        user/likes#index
#                          POST   /user/speeches/:speech_id/likes(.:format)        user/likes#create
#         user_speech_like DELETE /user/speeches/:speech_id/likes/:id(.:format)    user/likes#destroy
#     user_speech_comments POST   /user/speeches/:speech_id/comments(.:format)     user/comments#create
#      user_speech_comment DELETE /user/speeches/:speech_id/comments/:id(.:format) user/comments#destroy
#            user_speeches GET    /user/speeches(.:format)                         user/speeches#index
#                          POST   /user/speeches(.:format)                         user/speeches#create
#          new_user_speech GET    /user/speeches/new(.:format)                     user/speeches#new
#         edit_user_speech GET    /user/speeches/:id/edit(.:format)                user/speeches#edit
#              user_speech GET    /user/speeches/:id(.:format)                     user/speeches#show
#                          PATCH  /user/speeches/:id(.:format)                     user/speeches#update
#                          PUT    /user/speeches/:id(.:format)                     user/speeches#update
#                          DELETE /user/speeches/:id(.:format)                     user/speeches#destroy
#              admin_likes GET    /admin/likes(.:format)                           admin/likes#index
#              admin_users GET    /admin/users(.:format)                           admin/users#index

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
