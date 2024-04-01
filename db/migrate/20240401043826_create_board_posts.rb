class CreateBoardPosts < ActiveRecord::Migration[6.1]
  def change
    create_table :board_posts do |t|
      t.integer :board_id,null: false
      t.integer :user_id,null: false
      t.string :content,null: false
      t.datetime :created_at, precision: 6, null: false
      t.datetime :updated_at, precision: 6, null: false
    end
  end
end