class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :username,null: false
      t.string :email,null: false
      t.string :password,null: false
      t.boolean :is_admin
      t.boolean :is_public

      t.timestamps
    end
  end
end
