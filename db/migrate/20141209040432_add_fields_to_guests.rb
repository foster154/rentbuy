class AddFieldsToGuests < ActiveRecord::Migration
  def change
  	add_column :guests, :foreclosures, :boolean
  	add_column :guests, :short_sales, :boolean
  end
end
