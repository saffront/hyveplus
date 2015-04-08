require 'rails_helper'

RSpec.describe Hyve, type: :model do

	let!(:hyve) { create(:hyve ) }
	it { should belong_to(:user) }

  
  describe '#toggle missing' do
    it {
      expect(hyve.toggle_missing).to eq true
    }
  end

  describe '#toggle destroyed' do
    it {
      expect(hyve.toggle_destroyed).to eq true
    }
  end

  describe '#get missing' do
    before {
      hyve.toggle_missing
    }
    it {
      expect(Hyve.get_missing.size).to eq 1
    }
  end

  describe '#get destroyed' do
    before {
      hyve.toggle_destroyed
    }
    it {
      expect(Hyve.get_destroyed.size).to eq 1
    }
  end

  describe '#get my missing' do
    before {
      hyve.toggle_missing
    }
    it {
      expect(Hyve.get_my_missing(hyve.user).size).to eq 1
    }
  end

  describe '#get my destroyed' do
    before {
      hyve.toggle_destroyed
    }
    it {
      expect(Hyve.get_my_destroyed(hyve.user).size).to eq 1
    }
  end

end
