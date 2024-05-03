class Public::NotificationsController < ApplicationController
  before_action :authenticate_user!
  #def update
    #notification = current_user.notifications.find(params[:id])
    #notification.update(read: true)
    # 通知の種類によるリダイレクトパスの生成
    #case notification.notifiable_type
    #when "chats"
      #redirect_to book_path(notification.notifiable)
    #else
      #redirect_to user_path(notification.notifiable.user)
    #end
  #end
  def update
    notification = Notification.find(params[:id])
    notification.update(checked: true)
    redirect_to notification_path(notification)
  end
end
