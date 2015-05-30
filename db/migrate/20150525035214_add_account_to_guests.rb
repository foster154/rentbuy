class AddAccountToGuests < ActiveRecord::Migration
  def change
    add_column :guests, :account_id, :integer
    add_index :guests, :account_id
  end
end
