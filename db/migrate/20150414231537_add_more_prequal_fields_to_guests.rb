class AddMorePrequalFieldsToGuests < ActiveRecord::Migration
  def change
  	add_column :guests, :email_page, :boolean
  	add_column :guests, :foreclosure_on_record, :boolean
  	add_column :guests, :sell_before_buy, :boolean
  	add_column :guests, :buy_within_six_months, :boolean
  end
end

