class User::CommentsController < ApplicationController
  before_action :authenticate_user! 

  def create 
    @comment = current_user.comments.new(comment_params)
    @comment.speech_id = params[:speech_id]
    @comment.save
    redirect_to user_speech_path(params[:speech_id]), notice: "コメントを投稿しました！"
  end

  def delete
  end

  private
  def comment_params
    params.require(:comment).permit(:content)
  end
end
