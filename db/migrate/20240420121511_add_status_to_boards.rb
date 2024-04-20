class AddStatusToBoards < ActiveRecord::Migration[6.1]
  def change
    add_column :boards, :status, :integer, default: 0, null: false
  end
end
