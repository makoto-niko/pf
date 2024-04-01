class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.integer :user_id,null: false
      t.string :title,null: false
      t.string :content,null: false
      t.boolean :is_public,null: false
      t.datetime :created_at, precision: 6, null: false
      t.datetime :updated_at, precision: 6, null: false

    end
  end
end
