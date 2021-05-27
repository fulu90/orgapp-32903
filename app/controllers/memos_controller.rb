class MemosController < ApplicationController

  def create
    @room = Room.find(params[:room_id])
    @memo = Memo.new(memo_params)
    @memo.save
  end

  def edit
    @memo = Memo.find(params[:id])
  end

  def update
    @room = Room.find(params[:room_id])
    # memo = Memo.find_by(room_id: @room)
    memo = Memo.find_by(room_id: @room)
    # memo = Memo.find(params[:id])
    memo.update(memos_params)
  end

  private

  def memo_params
    params.permit(:mtext).merge(room_id: @room.id)
  end

  def memos_params
    params.require(:memo).permit(:mtext).merge(room_id: @room.id)
  end

end
