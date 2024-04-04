class CreateAdmins < ActiveRecord::Migration[6.1]
  def change
     create_table :admins do |t|
      t.string :username, null: false
      t.string :email, null: false
      t.datetime :created_at, precision: 6, null: false
      t.datetime :updated_at, precision: 6, null: false
    end
    
    add_index :admins, :reset_password_token, unique: true
    end
  end


