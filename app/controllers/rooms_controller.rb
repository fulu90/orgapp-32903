class RoomsController < ApplicationController
  def index
    @time = Time.new
    @week = %w(日 月 火 水 木 金 土)[@time.wday]
    @contact = Contact.first
  end
  
  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    if @room.save
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    room = Room.find(params[:id])
    room.destroy
    redirect_to root_path
  end

  private

  def room_params
    params.require(:room).permit(:tname, user_ids: [])
  end
end
