class User::SpeechesController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_speech_owner, only: [:edit, :update, :destroy]

  def new
    @speech = Speech.new
  end

  def create
    @speech = current_user.speeches.new(speech_params)
    if @speech.save
      redirect_to user_speech_path(@speech), notice: "スピーチを登録しました"
    else 
      render :new
    end
  end

  def show
    @speech = Speech.find(params[:id])
    @comments = @speech.comments
    @comment = Comment.new
  end

  def index
    @speeches = Speech.all
  end

  def edit
    @speech = Speech.find(params[:id])
  end

  def update
    @speech = Speech.find(params[:id])
    if @speech.update(speech_params)
      @speech.save
      redirect_to user_speech_path(@speech), notice: "スピーチを更新しました"
    else
      render :edit
    end
  end

  def destroy
    @speech = Speech.find(params[:id])
    @speech.destroy
    redirect_to user_speeches_path, notice: "スピーチを削除しました。"
  end

  private
  def speech_params
    params.require(:speech).permit(:title, :content, :overview)
  end

  def ensure_speech_owner
    @speech = Speech.find(params[:id])
    if current_user.id != @speech.user_id
      redirect_to user_speeches_path, alert: "他人のスピーチは編集できません"
    end
  end
end
