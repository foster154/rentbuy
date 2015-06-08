class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

  belongs_to :account

  has_attached_file :user_image, :styles => { :medium => "300x300#", :thumb => "110x110#" }, :default_url => "blank-person.jpg"
  validates_attachment_content_type :user_image, :content_type => /\Aimage\/.*\Z/

	def is_admin?
		self.role == 1
	end

	def is_agent?
		self.role == 2
	end

	def is_lender?
		self.role == 3
	end
end
