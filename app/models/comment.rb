class Comment < ApplicationRecord
  belongs_to :board
  belongs_to :user
  
  validates :content, presence: true, length: { maximum: 20 }
  
  def written_by?(current_user)
     user == current_user
  end
end
