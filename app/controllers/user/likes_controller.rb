class User::LikesController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]
  after_action :create_notification, only: [:create]

  def create
    @speech = Speech.find(params[:speech_id])
    @like = current_user.likes.new(speech_id: params[:speech_id])
    @like.save
    redirect_to user_speech_path(@speech.id)
  end

  def destroy
    @like = current_user.likes.find_by(speech_id: params[:speech_id])
    @like.delete
    redirect_to user_speech_path(params[:speech_id])
  end

  def index
    @speech = Speech.find(params[:speech_id])
    @users = @speech.liked_users
  end

  private
  def create_notification
    return if @speech.user_id == current_user.id
    Notification.create(
      user_id: @speech.user.id,
      notified_by_id: current_user.id,
      speech_id: @speech.id,
      notified_type: "読んだ！",
      read: false
    )
  end
end
