class RemoveEmailAndPasswordDigestFromCustomers < ActiveRecord::Migration[6.1]
  def change
    remove_column :customers, :email, :string
    remove_column :customers, :password_digest, :string
  end
end
