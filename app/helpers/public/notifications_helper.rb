module Public::NotificationsHelper
  def notification_message(notification)
    # self.user_id は、このチャットを作成したユーザーのIDです。
   case notification.notifiable_type
    when "Chat"
       "#{notification.notifiable.user.username}さんが#{notification.notifiable.message}をメッセージを送信しました"
   end
  end
end
