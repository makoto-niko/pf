class Tag < ApplicationRecord
  #has_many :post_tags
  #has_many :posts, through: :post_tags
  has_many :board_tags,dependent: :destroy, foreign_key: 'tag_id'
  has_many :boards, through: :board_tags
  #belongs_to :group
end
