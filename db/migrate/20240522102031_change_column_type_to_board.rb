class ChangeColumnTypeToBoard < ActiveRecord::Migration[6.1]
  def change
    change_column :boards, :description, :text, null: false
  end
end
