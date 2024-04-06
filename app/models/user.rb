class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  #has_many :posts
  #has_many :comments
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

  validates :email, presence: true
  validates :password, presence: true
  validates :username, presence: true
 
  def full_name
    username
  end
end
