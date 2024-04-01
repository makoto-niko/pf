class CreateGroupMembers < ActiveRecord::Migration[6.1]
  def change
    create_table :group_members do |t|
      t.integer :group_member_id
      t.integer :group_id,null: false
      t.integer :member_user_id,null: false
      t.boolean :is_group_admin

      t.timestamps
    end
  end
end
