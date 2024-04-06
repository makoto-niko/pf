class AddUserIdToBoards < ActiveRecord::Migration[6.1]
  def change
    add_column :boards, :user_id, :integer
    add_column :boards, :group_id, :integer
  end
end
