class Hyvelet < ActiveRecord::Base
	belongs_to :user
	after_create :default_values
	acts_as_mappable


	def default_values
		if self.name.nil?
			self.name = self.pin
		end
		self.ismissing = false
		self.isdestroyed = false
	end

	def toggle_missing
		self.toggle! :ismissing
	end

	def toggle_destroyed
		self.toggle! :isdestroyed
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

end
