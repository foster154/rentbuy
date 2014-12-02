class AddImageColumnToProperties < ActiveRecord::Migration
  def self.up
  	add_attachment :properties, :property_image
  end

  def self.down
  	remove_attachment :properties, :property_image
  end
end
