class EmailSettings < ActiveRecord::Base
	belongs_to :user

	has_attached_file :to_guest_contents
	validates_attachment_content_type :to_guest_contents, :content_type => 'text/html'
	# validates_format_of :to_guest_contents_file_name, :with => /\.(html|erb)/

	has_attached_file :new_lead_email_contents
	validates_attachment_content_type :to_guest_contents, :content_type => 'text/html'

	has_attached_file :updated_lead_email_contents
	validates_attachment_content_type :to_guest_contents, :content_type => 'text/html'
	
end
