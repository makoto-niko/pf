class CreateGroupMessages < ActiveRecord::Migration[6.1]
  def change
    create_table :group_messages do |t|
      t.integer :group_id,null: false
      t.integer :user_id,null: false
      t.string :content,null: false
      t.datetime :sent_at,null: false

      t.timestamps
    end
  end
end
