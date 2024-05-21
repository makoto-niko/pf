class Public::ChatsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user_and_room, only: [:show]

  def show
    @chats = @room.chats
    @chat = Chat.new(room_id: @room.id)
  end

  def create
    @chat = current_user.chats.new(chat_params)
    @chat.created_at = Time.current
    if @chat.save
      @chats = current_user.chats.order(created_at: :desc) # チャットの一覧を取得
     redirect_to public_user_chat_path(other_user, @chat), notice: "投稿に成功しました"
    else
      @chats = current_user.chats.order(created_at: :desc) # チャットの一覧を取得
      render 'public/chats/show'
    end
  end

  private

  def set_user_and_room
    @user = User.find(params[:user_id])
    @room = find_or_create_room
  end

  def find_or_create_room
    rooms = current_user.user_rooms.pluck(:room_id)
    user_room = UserRoom.find_by(user_id: @user.id, room_id: rooms)
    return user_room.room if user_room
    create_new_room
  end

  def create_new_room
    room = Room.create
    UserRoom.create(user_id: @user.id, room_id: room.id)
    UserRoom.create(user_id: current_user.id, room_id: room.id)
    room
  end

  def chat_params
    params.require(:chat).permit(:message, :room_id)
  end
end
