class RoomsController < ApplicationController
  def index
    debugger
    @room = Room.new
    @current_user = User.find(session[:user_id])
    redirect_to '/signin' unless @current_user
    @rooms = Room.public_rooms
    @users = User.all_except(@current_user)
  end
   
   # def new
   #   @room = Room.new
   # end

  def create
    debugger
    @room = Room.create(name: params["room"]["name"])
    if @room.save
    redirect_to @room, notice: 'Room was successfully created.'
    else
    head :no_content
    end
  end
end
