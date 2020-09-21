class RoomsController < ApplicationController
  before_action :authenticate_user!

   def index
    @rooms = Room.where(user_id: current_user.id)
    # @room = Room.find(params[:room_id])
    # @messages = @room.messages.includes(:user)
   end


   def create
       @room = Room.new(name: params[:name], ticket_id: params[:ticket_id])
      if @room.save
        RoomUser.create(room_id: @room.id, user_id: current_user.id)
        RoomUser.create(room_id: @room.id, user_id: Ticket.find(params[:ticket_id]).user_id)
        redirect_to  user_room_messages_path(Ticket.find(params[:ticket_id]).user_id, @room.id)
       else
        render :create
      end
   end
end

# index
  #@room = Room.find(params[:room_id])
  # @messages = @room.messages.includes(:user)

# @ticket = Ticket.find(params[:ticket_id])
# @user = User.find(user_id: current_user.id)
#   @currentRoomUser = RoomUser.where(user_id: current_user.id)
#   @RoomUserEntry   = RoomUser.where(user_id:  @user.id)
#     @currentRoomUser.each do |cu|
#     @RoomUserEntry .each do |u|
#          if cu.room_id == u.room_id 
#         @room.ticket.id== ticket_id.room_id 
#         @isRoom = true
#         @roomId = cu.room_id
#   end
#    end
#     end

#     unless @isRoom