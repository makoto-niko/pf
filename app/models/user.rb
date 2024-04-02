class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :posts
  has_many :comments
  has_many :group_members
  has_many :groups, through: :group_members
  has_many :group_messages
  has_many :board_posts
   
  validates :username, presence: true
  
  def full_name
    username
  end
end
