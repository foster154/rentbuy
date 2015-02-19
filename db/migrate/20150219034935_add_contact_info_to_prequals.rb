class AddContactInfoToPrequals < ActiveRecord::Migration
  def change
  	remove_column :prequals, :contact_now, :boolean
  	remove_column :prequals, :contact_time, :datetime

  	add_column :prequals, :yes_call, :boolean
  	add_column :prequals, :yes_email, :boolean
  	add_column :prequals, :prequal_phone, :string
  	add_column :prequals, :prequal_email, :string
  	add_column :prequals, :call_time, :datetime

  end
end
