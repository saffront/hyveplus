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
  validates :password, length: { minimum: 5 }, if: :password
  validates :password, confirmation: true, if: :password
  validates :password_confirmation, presence: true, if: :password
  validates :email, uniqueness: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }

  #Carrierwave
  mount_uploader :avatar, AvatarUploader
  
  def set_access_token(token, secret, provider)
    auth = self.authentications.find_by(provider: provider)
    auth.update(token: token, secret: secret)
  end

  def full_name
    self.first_name + ' ' + self.last_name
  end

  #def update_password_and_email(current_password, new_email, new_password, new_password_confirmation)
    #if User.authenticate(self.email, current_password).present?
      #self.password_confirmation = new_password_confirmation
      #self.update(email: new_email)
      #self.change_password!(new_password)
    #end
  #end

  private

  def set_default_email
    return unless self.email.nil?
    self.email = loop do
      email = "#{SecureRandom.urlsafe_base64}@changeme.com"
      break email unless User.where(email: email).exists?
    end
  end

  def set_default_password
    return unless self.password.nil?
    password = SecureRandom.hex
    self.password = password
    self.password_confirmation = password
  end
end
