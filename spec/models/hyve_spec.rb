require 'rails_helper'

RSpec.describe Hyve, type: :model do

	it { should belong_to(:user) }
end
