class CommentsController < ApplicationController
  def create
    comment = Comment.new(params[:comment])
    comment.user_id = current_user.id
    comment.event_id = params[:event_id]
    comment.save
    redirect_to :back
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy if @comment.user == current_user
    redirect_to :back
  end
end
