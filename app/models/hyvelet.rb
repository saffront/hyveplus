class Hyvelet < ActiveRecord::Base
	belongs_to :user
	before_save :default_values
	acts_as_mappable

	EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
	
	validates :email, :pin, presence: true
	validates_format_of :email, with: EMAIL_REGEX, on: [:create, :update]

	def default_values
		self.name = self.pin
		self.ismissing = false
		self.isdestroyed = false
	end

	def toggle_missing
		self.ismissing = !self.ismissing
	end

	def toggle_destroyed
		self.isdestroyed = !self.isdestroyed
	end

	def self.get_missing
		Hyvelet.where( ismissing: true )
	end

	def self.get_destroyed
		Hyvelet.where( isdestroyed: true )
	end

	def self.get_my_missing(user)
		Hyvelet.where( ismissing: true, user: user )
	end

	def self.get_my_destroyed(user)
		Hyvelet.where( isdestroyed: true, user: user )
	end

	def update_location(lat, lng)
		self.lat = lat
		self.lng = lng
	end

	def update_name(name)
		self.name = name
	end
end
