class ChatsController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
    rooms = current_user.user_rooms.pluck(:room_id)
    user_rooms = UserRoom.find_by(user_id: @user.id, room_id: rooms)

    if user_rooms.nil?
      @room = Room.new
      @room.save
      UserRoom.create(user_id: current_user.id, room_id: @room.id)
      UserRoom.create(user_id: @user.id, room_id: @room.id)
    else
      @room = user_rooms.room
    end
    @chats = @room.chats
    @chat = Chat.new(room_id: @room.id)
  end

  def create
    chat = Chat.new(chat_params)
    chat.user_id = current_user.id
    chat.save
    redirect_back(fallback_location: root_path)
  end

  private

  def chat_params
    params.require(:chat).permit(:message, :room_id)
  end
end
