class User < ActiveRecord::Base
	has_many :hyvelets
  	authenticates_with_sorcery!
end
