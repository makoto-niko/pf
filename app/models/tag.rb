class Tag < ApplicationRecord
  has_many :board_tags,dependent: :destroy, foreign_key: 'tag_id'
  has_many :boards, through: :board_tags
  
  scope :search_by_name, ->(keyword) { where('name LIKE ?', "%#{keyword}%") }
end
