class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :comments,dependent: :destroy
  has_many :boards,dependent: :destroy
  
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
  
  def active_for_authentication?
    super && is_active 
  end
  
  def self.search_for(content, method)
      if method == 'perfect'
        User.where(username: content)
      elsif method == 'forward'
        User.where('username LIKE ?', content + '%')
      elsif method == 'backward'
        User.where('username LIKE ?', '%' + content)
      else
        User.where('username LIKE ?', '%' + content + '%')
      end
  end
  
  def is_admin?
    self.is_admin
  end
  
  has_many :active_relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :passive_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  has_many :followings, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower
  
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
  #searchに退会は出さないようにするscope
   scope :active, -> { where(is_active: true) }
end
