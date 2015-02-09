class Hyvelet < ActiveRecord::Base
	belongs_to :user
	before_save :default_values
	acts_as_mappable
	
	def default_values
		self.ismissing = false
		self.isdestroyed = false
	end

	def toggle_missing
		self.ismissing = !self.ismissing
	end

	def toggle_destroyed
		self.isdestroyed = !self.isdestroyed
	end
end
