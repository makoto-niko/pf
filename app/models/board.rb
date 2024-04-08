class Board < ApplicationRecord
    belongs_to :group
    belongs_to :user
    has_many :comments
      # タイトルが空でないこと、文字数が50文字以内であることを検証
  validates :title, presence: true, length: { maximum: 50 }
  
  # 説明が空でないこと、文字数が100文字以内であることを検証
  validates :description, presence: true, length: { maximum: 100 }
end
