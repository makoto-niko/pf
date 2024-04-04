class Board < ApplicationRecord
    belongs_to :group
    has_many :board_posts
end
