class User::CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_comment_owner, only: [:destroy]
  after_action :create_notification, only: [:create]

  def create
    @speech = Speech.find(params[:speech_id])
    @comment = current_user.comments.new(comment_params)
    @comment.speech_id = params[:speech_id]
    if @comment.save
      redirect_to user_speech_path(@speech), notice: "コメントを投稿しました！"
    else
      redirect_to user_speech_path(@speech), alert: "コメント内容を入力してください"
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.delete
    redirect_to user_speech_path(params[:speech_id]), notice: "コメントを削除しました"
  end

  private
  def comment_params
    params.require(:comment).permit(:content)
  end

  def ensure_comment_owner
    @comment = Comment.find(params[:id])
    if current_user.id != @comment.user_id
      redirect_to user_speech_path(@comment.speech), alert: "他人のコメントは編集できません"
    end
  end

  def create_notification
    return if @speech.user_id == current_user.id
    Notification.create(
      user_id: @speech.user.id,
      notified_by_id: current_user.id,
      speech_id: @speech.id,
      notified_type: "コメント",
      read: false
    )
  end
end
