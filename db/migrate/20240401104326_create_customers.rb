class CreateCustomers < ActiveRecord::Migration[6.1]
  def change
    create_table :customers do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.string :password_digest, null: false
      t.boolean :is_deleted, default: false, null: false

      t.timestamps
    end

    add_index :customers, :email, unique: true
  end
end
