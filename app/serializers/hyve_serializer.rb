class HyveSerializer < ActiveModel::Serializer

  # :pin, :lat, :lng
  attributes :id, :name, :created_at, :updated_at, :user_id, :distance, :uuid, :image
 
end
