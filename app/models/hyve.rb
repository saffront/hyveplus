class Hyve < ActiveRecord::Base
	extend Enumerize
	enumerize :status, in: [:missing, :destroyed], scope: :status

	belongs_to :user
	after_create :default_values
	acts_as_mappable
	has_many :hyve_missing_locations

  #Validations
  validates_presence_of :name

  validates_presence_of :uuid
  validates_uniqueness_of :uuid
  validates_format_of :uuid, with: /\A[\w -]+\z/, message: "can only have alphanumeric or - characters"

  #validates_presence_of :distance
  #validates_format_of :distance, with: /\A\d{1,2}\z/, message: "must be a number from 1-99"
  #validates_format_of :distance, without: /\A0/, message: "can only have digits and cannot be 0"


  #Carrierwave
  mount_uploader :image, HyveImageUploader

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
