class AddFieldsToUsers < ActiveRecord::Migration
  def change
	add_column :users, :company, :string
	add_column :users, :phone, :string
	add_column :users, :lender_number, :string
	add_column :users, :other_info, :string
	add_column :users, :user_url, :string
	add_attachment :users, :user_image
	add_attachment :users, :email_to_guest
	add_attachment :users, :lead_notification_contents
  end
end
