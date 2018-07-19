class User::LikesController < ApplicationController
  before_action :authenticate_user! 

  def create
    @like = current_user.likes.new(speech_id: params[:speech_id])
    @like.save
    redirect_to user_speech_path(params[:speech_id])
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
end
