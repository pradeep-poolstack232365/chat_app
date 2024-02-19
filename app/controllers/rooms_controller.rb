class RoomsController < ApplicationController

   def index
    # debugger
    @room = Room.new
    @current_user = User.find_by(id:  session[:user_id])
    redirect_to '/signin' unless @current_user
    @rooms = Room.public_rooms
    @users = User.all_except(@current_user)
   end
   
   # def new
   #   @room = Room.new
   # end

   def show
    # debugger
    @current_user = current_user
    @single_room = Room.find(params[:id])
    @rooms = Room.public_rooms
    @users = User.all_except(@current_user)
    @room = Room.new
    @message = Message.new
    @messages = @single_room.messages

    render "index"
   end

   def create
    # debugger
    @room = Room.create(name: params["room"]["name"])
     if @room.save
        redirect_to @room, notice: 'Room was successfully created.'
     else
        head :no_content
     end
    end
end
