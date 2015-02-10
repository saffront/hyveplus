class Authentication < ActiveRecord::Base
  # Rails 4 uses strong params
  # attr_accessible :user_id, :provider, :uid
  belongs_to :user
end
