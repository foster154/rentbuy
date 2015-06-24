class AddResultToGuests < ActiveRecord::Migration
  def change
  	add_column :guests, :fha_result, :integer
  	add_column :guests, :conv_result, :integer
  end
end
