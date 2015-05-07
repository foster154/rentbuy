class MergePrequalsToGuests < ActiveRecord::Migration
  def up
  	drop_table :prequals

  	add_column :guests, :income, :string
  	add_column :guests, :debt, :string
  	add_column :guests, :down_payment, :string
  	add_column :guests, :self_employed, :boolean
  	add_column :guests, :first_time_buyer, :boolean
  	add_column :guests, :military, :boolean
  	add_column :guests, :yes_call, :boolean
  	add_column :guests, :yes_email, :boolean
  	add_column :guests, :phone, :string
  	add_column :guests, :call_time, :string
  	add_column :guests, :session_id, :string
  end

  def down
	create_table :prequals do |t|
		t.integer  :guest_id
		t.string   :income
		t.string   :debt
		t.string   :down_payment
		t.datetime :created_at
		t.datetime :updated_at
		t.boolean  :self_employed
		t.boolean  :first_time_buyer
		t.boolean  :military
		t.boolean  :yes_call
		t.boolean  :yes_email
		t.string   :prequal_phone
		t.string   :prequal_email
		t.string   :call_time
		t.string   :name
		t.string   :session_id
	end

	remove_column :guests, :income, :string
	remove_column :guests, :debt, :string
	remove_column :guests, :down_payment, :string
	remove_column :guests, :self_employed, :boolean
	remove_column :guests, :first_time_buyer, :boolean
	remove_column :guests, :military, :boolean
	remove_column :guests, :yes_call, :boolean
	remove_column :guests, :yes_email, :boolean
	remove_column :guests, :phone, :string
	remove_column :guests, :call_time, :string
	remove_column :guests, :session_id, :string
  end
end
