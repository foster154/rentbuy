class AddAccountAndRoleToUsers < ActiveRecord::Migration
  def change
    add_column :users, :account_id, :integer
    add_column :users, :role, :integer
    add_index :users, :account_id
  end
end
