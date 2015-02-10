class User < ActiveRecord::Base
	has_many :hyvelets

	EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
	
	validates :email, presence: true
	validates_format_of :email, with: EMAIL_REGEX, on: [:create, :update]
  
  authenticates_with_sorcery!

  validates :password, length: { minimum: 5 }
  validates :password, confirmation: true
  validates :password_confirmation, presence: true
  validates :email, uniqueness: true

end
