class HyveletSerializer < ActiveModel::Serializer

  attributes :id, :name, :pin, :lat, :lng, :created_at, :updated_at, :user_id, :status, :distance, :uuid, :image
 
	belongs_to :user
	#has_many :hyvelet_missing_locations
end
