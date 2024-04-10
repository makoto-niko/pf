class CreateBoardTags < ActiveRecord::Migration[6.1]
  def change
    create_table :board_tags do |t|
    t.integer :board_id ,null: false
    t.integer :tag_id ,null: false
      t.timestamps
    end
  end
end
