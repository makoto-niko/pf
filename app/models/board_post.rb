class BoardPost < ApplicationRecord
  belongs_to :board
  belongs_to :user
  belongs_to :group
end
