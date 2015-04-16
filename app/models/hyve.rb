class Hyve < ActiveRecord::Base

  #Associations
	belongs_to :user

  #Validations
  validates_presence_of :name

  validates_format_of :distance, with: /\A(1|2|4|8|16)\z/

  validates_inclusion_of :proximity, in: ["out of range", "close by"], allow_blank: true

  validates_presence_of :uuid
  validates_uniqueness_of :uuid, case_sensitive: false
  validates_format_of :uuid, with: /\A[\w -]+\z/, message: "can only have alphanumeric or - characters"
  

  #Carrierwave
  mount_uploader :image, HyveImageUploader

  def to_param
    uuid
  end

end
