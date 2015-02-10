class Hyvelet < ActiveRecord::Base
	extend Enumerize
	enumerize :status, in: [:missing, :destroyed]

	belongs_to :user
	after_create :default_values
	acts_as_mappable



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
		Hyvelet.where( status: :missing)
	end

	def self.get_destroyed
		Hyvelet.where( status: :destroyed)
	end

	def self.get_my_missing(user)
		Hyvelet.where( status: :missing, user: user )
	end

	def self.get_my_destroyed(user)
		Hyvelet.where( status: :destroyed, user: user )
	end

end
