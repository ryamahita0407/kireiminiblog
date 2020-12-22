class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    if @comment.valid?
      @comment.save
      redirect_to miniblog_path(params[:miniblog_id])
    else
      redirect_to miniblog_path(params[:miniblog_id])
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, miniblog_id: params[:miniblog_id])
  end
end
