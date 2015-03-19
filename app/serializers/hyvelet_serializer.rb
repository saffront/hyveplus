class HyveletSerializer < ActiveModel::Serializer

  attributes :id, :name, :pin, :lat, :lng, :created_at, :updated_at, :user_id, :status, :distance, :uuid, :image
 
  has_one :user
end
