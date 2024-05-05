class Chat < ApplicationRecord
belongs_to :user
belongs_to :room
has_many :notifications, as: :notifiable, dependent: :destroy
after_create_commit :create_notifications

  def create_notifications
    # self.user_id は、このチャットを作成したユーザーのIDです。
    self.room.user_rooms.where.not(user_id: self.user_id).each do |user|
      # ここで各ユーザーに対して通知を作成します。
      Notification.create!(
        user_id: user.user_id,  # 通知を受けるユーザー
        notifiable: self,  # 関連するチャット
      )
    end
  end
end
