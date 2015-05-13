class User < ActiveRecord::Base
  #
  #Sorcery
  authenticates_with_sorcery! do |config|
    config.authetications_class = Authentication
  end

  #Callbacks
  after_initialize :set_default_password, if: :new_record?

  #Associations
  has_many :authentications, dependent: :destroy
  has_many :hyves, dependent: :destroy
  accepts_nested_attributes_for :authentications

  #Validations
  validates :password, length: { minimum: 8 }, if: :password
  validates :password, confirmation: true, if: :password
  validates :password_confirmation, presence: true, if: :password

  validates_uniqueness_of :email, case_senstive: false
  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/

  validates_presence_of :first_name
  
  validates_format_of :username, with: /\A[\w_ -]+\z/, message: "can only contain alphanumeric, - and _ characters"

  #Carrierwave
  mount_uploader :avatar, AvatarUploader

  #Decorator/Presenter
  def full_name
    self.first_name + " " + self.last_name
  end

  #Mobile App API
  def generate_api_token!
    generate_token(:api_token)
  end

  private

  def set_default_password
    return unless self.password.nil?
    password = SecureRandom.hex
    self.password = password
    self.password_confirmation = password
  end

  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while User.exists?(column => self[column])
    save!
  end
end
