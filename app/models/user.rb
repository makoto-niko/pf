class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  #has_many :posts
  has_many :comments
  #has_many :group_members
  #has_many :groups, through: :group_members
  #has_many :group_messages
  #has_many :board_posts
  has_many :boards
  
 GUEST_USER_EMAIL = "guest@example.com"

  def self.guest
    find_or_create_by!(email: GUEST_USER_EMAIL) do |user|
      user.password = SecureRandom.urlsafe_base64
      user.username = "guestuser"
    end
  end

   validates :email, presence: true,length: { maximum: 20 }
   validates :username, presence: true,length: { maximum: 20 }
 
  def full_name
    username
  end
  
  
  def customer_status
    if is_deleted == true
      "退会"
    else
      "有効"
    end
  end
   # (退会処理)
  def active_for_authentication?
    super && is_active 
  end
  
  def self.search_for(content, method)
      if method == 'perfect'
        User.where(name: content)
      elsif method == 'forward'
        User.where('name LIKE ?', content + '%')
      elsif method == 'backward'
        User.where('name LIKE ?', '%' + content)
      else
        User.where('name LIKE ?', '%' + content + '%')
      end
  end




end
