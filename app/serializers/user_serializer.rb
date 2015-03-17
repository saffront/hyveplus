class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :password, :password_confirmation, :created_at, :updated_at, :reset_password_token, :reset_password_token_expires_at, :reset_password_email_sent_at, :activation_state, :activation_token, :activation_token_expires_at, :username, :avatar, :first_name, :last_name, :subscription

  has_many :authentications
  has_many :hyvelets
end
