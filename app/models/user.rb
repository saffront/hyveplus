class User < ActiveRecord::Base

  authenticates_with_sorcery!

  authenticates_with_sorcery! do |config|
    config.authetications_class = Authentication
  end

  has_many :authentications, dependent: :destroy
  has_many :hyvelets

  accepts_nested_attributes_for :authentications

  after_initialize :set_default_password, if: :new_record?
  before_validation :set_default_email, if: :new_record?

  validates :password, length: { minimum: 8 }, if: :password
  validates :password, confirmation: true, if: :password
  validates :password_confirmation, presence: true, if: :password

  validates :email, uniqueness: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }

  validates_presence_of :first_name

  validates_uniqueness_of :username, case_sensitive: false
  #Regex for friendly ID and parameterize
  validates_format_of :username, with: /\A[a-zA-Z0-9_ -]+\z/, message: "can only have alphanumeric, - or _ characters"
  validates_format_of :username, without: /\A\d/, message: "cannot start with number"

  #Carrierwave
  mount_uploader :avatar, AvatarUploader

  def to_param
    if username
      username.parameterize
    else
      super
    end
  end

  def self.find(input)
    #ruby converts strings starting with letter to 0
    input.to_i == 0 ? find_by_username(input) : super
  end

  def set_access_token(token, secret, provider)
    auth = self.authentications.find_by(provider: provider)
    auth.update(token: token, secret: secret)
  end

  #Mobile App API
  def generate_api_token!
    generate_token(:api_token)
  end

  private

  def set_default_email
    return unless self.email.nil?
    self.email = loop do
      email = "#{SecureRandom.urlsafe_base64(6)}@changeme.com"
      break email unless User.where(email: email).exists?
    end
  end

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
