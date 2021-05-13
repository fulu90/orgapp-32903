class CommentsController < ApplicationController
  def index
    @comment = Comment.new
    @room = Room.find(params[:room_id])
    @comments = @room.comments.includes(:user)
  end

  def create
    @room = Room.find(params[:room_id])
    @comment = @room.comments.new(comment_params)
    if @comment.save
      redirect_to room_comments_path(@room)
    else
      @comments = @room.comments.includes(:user)
      render :index
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content).merge(user_id: current_user.id)
  end
end
