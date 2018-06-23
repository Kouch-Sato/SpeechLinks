class User::SpeechesController < ApplicationController
  before_action :authenticate_user!

  def new
    @speech = Speech.new
  end

  def create
    @speech = Speech.new(speech_params)
    if @speech.save
      redirect_to user_speeches_path, notice: "記事を作成しました。"
    else 
      render :new
    end
  end

  def show
    @speech = Speech.find(params[:id])
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
      redirect_to user_speech_path(@speech), notice: "記事を更新しました"
    else
      render :edit
    end
  end

  def destroy
    @speech = Speech.find(params[:id])
    @speech.destroy
    redirect_to user_speeches_path, notice: "記事を削除しました。"
  end

  private
  def speech_params
    params.require(:speech).permit(:title, :content)
  end
end
