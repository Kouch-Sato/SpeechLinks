class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_current_user, only: [:edit, :update]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @speeches = @user.speeches.order("created_at DESC")
    @liked_speeches = @user.liked_speeches.order("created_at DESC")
    @commented_speeches = @user.commented_speeches.order("created_at DESC")
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      @user.save
      redirect_to user_path(@user), notice: "プロフィールを更新しました"
    else
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :bio, :university, :grade)
  end

  def ensure_current_user
    if current_user.id != params[:id].to_i
      redirect_to user_speeches_path, alert: "他のユーザーの情報は編集できません"
    end
  end  
end
