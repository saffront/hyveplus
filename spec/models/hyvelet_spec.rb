require 'rails_helper'

RSpec.describe Hyvelet, :type => :model do

	let!(:hyvelet) { create(:hyvelet ) }
	it { should belong_to(:user) }

  
  describe '#toggle missing' do
    it {
      expect(hyvelet.toggle_missing).to eq true
    }
  end

  describe '#toggle destroyed' do
    it {
      expect(hyvelet.toggle_destroyed).to eq true
    }
  end

  describe '#get missing' do
    before {
      hyvelet.toggle_missing
    }
    it {
      expect(Hyvelet.get_missing.size).to eq 1
    }
  end

  describe '#get destroyed' do
    before {
      hyvelet.toggle_destroyed
    }
    it {
      expect(Hyvelet.get_destroyed.size).to eq 1
    }
  end

  describe '#get my missing' do
    before {
      hyvelet.toggle_missing
    }
    it {
      expect(Hyvelet.get_my_missing(hyvelet.user).size).to eq 1
    }
  end

  describe '#get my destroyed' do
    before {
      hyvelet.toggle_destroyed
    }
    it {
      expect(Hyvelet.get_my_destroyed(hyvelet.user).size).to eq 1
    }
  end

end
