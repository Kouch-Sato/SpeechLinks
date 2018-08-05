class User::NotificationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @notification = current_user.notification.order("created_at DESC")
  end

  def show
    @notification = Notification.find(params[:id])
    @notification.update(read: true)
    redirect_to user_speech_path(@notification.speech)
  end
end
