class Group < ApplicationRecord
  has_many :boards,dependent: :destroy
  belongs_to :admin
  
  validates :name, presence: true, length: { maximum: 20 }
  validates :description, presence: true, length: { maximum: 30} 
end
