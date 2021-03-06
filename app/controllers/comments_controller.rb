class CommentsController < ApplicationController
  def index
    @time = Time.new
    @week = %w(日 月 火 水 木 金 土)[@time.wday]
    @comment = Comment.new
    @room = Room.find(params[:room_id])
    @comments = @room.comments.includes(:user)
    @contact = Contact.first
    @memo = Memo.find_by(room_id: @room)
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
