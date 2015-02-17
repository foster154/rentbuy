class RemoveFieldsFromGuests < ActiveRecord::Migration
  def change
  	remove_column :guests, :foreclosures, 	:boolean
  	remove_column :guests, :short_sales, 	:boolean
  	remove_column :guests, :income, 		:integer
  	remove_column :guests, :debt, 			:integer
  	remove_column :guests, :down_payment, 	:integer

  	add_column :guests, :want_list, :boolean
    add_column :guests, :sqft, :integer
  	add_column :prequals, :self_employed, :boolean
  	add_column :prequals, :first_time_buyer, :boolean
  	add_column :prequals, :military, :boolean
    add_column :prequals, :contact_now, :boolean
    add_column :prequals, :contact_time, :datetime
  end
end
