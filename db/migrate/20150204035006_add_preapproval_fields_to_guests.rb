class AddPreapprovalFieldsToGuests < ActiveRecord::Migration
  def change
  	add_column :guests, :preapproval, :boolean
  	add_column :guests, :income, :integer
  	add_column :guests, :debt, :integer
  	add_column :guests, :down_payment, :integer
  end
end
