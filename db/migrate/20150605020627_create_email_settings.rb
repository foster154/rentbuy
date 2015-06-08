class CreateEmailSettings < ActiveRecord::Migration
  def change
    create_table :email_settings do |t|

    	t.references :user, unique: true
    	t.string :reply_to_address
    	t.string :send_leads_to_address

    	t.boolean :send_to_guest
    	t.string :to_guest_subject
    	t.attachment :to_guest_contents

		t.boolean :new_lead_notification
     	t.string :new_lead_subject
    	t.attachment :new_lead_email_contents  	

    	t.boolean :updated_lead_notification
    	t.string :updated_lead_subject
    	t.attachment :updated_lead_email_contents

      	t.timestamps

    end

    # remove the columns from the users table that were for email settings.

    remove_column :users, :email_to_guest_file_name, :string
    remove_column :users, :email_to_guest_content_type, :string
    remove_column :users, :email_to_guest_file_size, :integer
    remove_column :users, :email_to_guest_updated_at, :datetime
    remove_column :users, :lead_notification_contents_file_name, :string
    remove_column :users, :lead_notification_contents_content_type, :string
    remove_column :users, :lead_notification_contents_file_size, :integer
    remove_column :users, :lead_notification_contents_updated_at, :datetime

  end
end
