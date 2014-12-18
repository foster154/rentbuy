class AddFieldsToGuests < ActiveRecord::Migration
  def change
  	add_column :guests, :foreclosures, :boolean
  	add_column :guests, :short_sales, :boolean
  	add_column :guests, :beds, :integer
  	add_column :guests, :baths, :integer
  	add_column :guests, :areas, :string
  end
end
