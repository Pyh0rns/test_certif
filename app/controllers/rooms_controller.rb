class RoomsController < ApplicationController
  def index
    @rooms = Room.all
    @markers = @rooms.geocoded.map do |room|
      {
        lat: room.latitude,
        lng: room.longitude
      }
    end
  end

  def show
    @room = Room.find(params[:id])
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    if @room.save
      redirect_to room_path(@room)
    else
      render :new
    end
  end

  private

  def room_params
    params.require(:room).permit(:price, :number, :photo)
  end
end
