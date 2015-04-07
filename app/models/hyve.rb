class Hyve < ActiveRecord::Base
	extend Enumerize
	enumerize :status, in: [:missing, :destroyed], scope: :status
	acts_as_mappable

	belongs_to :user
	after_create :default_values
	has_many :hyve_missing_locations

  #Validations
  validates_presence_of :name
  validates_presence_of :uuid
  validates_uniqueness_of :uuid, case_sensitive: false
  validates_format_of :uuid, with: /\A[\w -]+\z/, message: "can only have alphanumeric or - characters"

  #Carrierwave
  mount_uploader :image, HyveImageUploader
  mount_base64_uploader :image, HyveImageUploader

  def to_param
    uuid
  end

	def default_values
		if self.name.nil?
			self.name = self.pin
		end
	end

	def toggle_missing
		self.update(status: :missing)
	end

	def toggle_destroyed
		self.update(status: :destroyed)
	end

	def self.get_missing
		Hyve.where( status: :missing)
	end

	def self.get_destroyed
		Hyve.where( status: :destroyed)
	end

	def self.get_my_missing(user)
		Hyve.where( status: :missing, user: user )
	end

	def self.get_my_destroyed(user)
		Hyve.where( status: :destroyed, user: user )
	end

end
