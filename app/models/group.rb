class Group < ApplicationRecord
  has_many :boards
  #has_many :group_members
  #has_many :users, through: :group_members
  #has_many :group_messages
  belongs_to :admin
  #has_many :board_posts
end
