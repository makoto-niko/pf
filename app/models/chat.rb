class Chat < ApplicationRecord
belongs_to :user
belongs_to :room
  has_many :notifications, as: :notifiable, dependent: :destroy
  after_create_commit :create_notifications
#after_create :create_notifications

def create_notifications
  # 仮定: self.room.users は、このチャットのルームに属する全ユーザーを返します。
  # self.user_id は、このチャットを作成したユーザーのIDです。
  self.room.user_rooms.where.not(user_id: self.user_id).each do |user|
    # ここで各ユーザーに対して通知を作成します。
    Notification.create!(
      user_id: user.user_id,  # 通知を受けるユーザー
      notifiable: self,  # 関連するチャット
    )
  end
end

  #def create_notifications
    # ここでは、roomに属する全てのuserに対して通知を送る
    #room.users.each do |user|
     # notifications.create(user_id: user.id, content: "新しいチャットがあります")
    #end
  #end
end
