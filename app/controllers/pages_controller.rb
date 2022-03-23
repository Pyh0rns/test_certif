class PagesController < ApplicationController
  def home
    @rooms = Room.all
    @markers = @rooms.geocoded.map do |room|
      {
        lat: room.latitude,
        lng: room.longitude
      }
    end
  end
end
