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
  validates :password, length: { minimum: 5 }
  validates :password, confirmation: true
  validates :password_confirmation, presence: true
  validates :email, uniqueness: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }

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
