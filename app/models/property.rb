class Property < ActiveRecord::Base
	belongs_to :area
	has_attached_file :property_image, :styles => { :full => "640x480>", :medium => "200x130", :thumb => "80x60>" }, :default_url => "/images/:style/missing.png"
	validates_attachment_content_type :property_image, :content_type => /\Aimage\/.*\Z/
	validates :address, presence: true
	validates :area_id, presence: true

	self.per_page = 2
end
