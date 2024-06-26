class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :comments, dependent: :destroy
  has_many :boards, dependent: :destroy
  has_many :active_relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :passive_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  has_many :followings, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower
  has_many :user_rooms, dependent: :destroy
  has_many :chats, dependent: :destroy
  has_many :notifications, dependent: :destroy
  
  validates :email, presence: true
  validates :username, presence: true, length: { maximum: 20 }, uniqueness: true
  
  GUEST_USER_EMAIL = "guest@example.com"

  def self.guest
    find_or_create_by!(email: GUEST_USER_EMAIL) do |user|
      user.password = SecureRandom.urlsafe_base64
      user.username = "guestuser"
    end
  end

  def full_name
    username
  end
  
  def active_for_authentication?
    super && is_active 
  end
  
  def self.search_for(content, method)
    if method == 'perfect'
      User.where(username: content)
    elsif method == 'forward'
      User.where('username LIKE ?', "#{content}%")
    elsif method == 'backward'
      User.where('username LIKE ?', "%#{content}")
    else
      User.where('username LIKE ?', "%#{content}%")
    end
  end
  
  def guest?
    email == "guest@example.com"
  end
  
  def follow(user)
    return if user == self
    active_relationships.create(followed_id: user.id)
  end
  
  def unfollow(user)
    active_relationships.find_by(followed_id: user.id).destroy
  end
  
  def following?(user)
    followings.include?(user)
  end
  #退会は出さないようにするscope
   scope :active, -> { where(is_active: true) }
end
