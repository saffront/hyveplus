require 'rails_helper'

RSpec.describe Hyvelet, :type => :model do

	let!(:hyvelet) { create(:hyvelet ) }
	it { should belong_to(:user) }

  describe '#missing' do
    it {
      expect(hyvelet.ismissing).to eq false
    }
  end

  describe '#destroyed' do
    it {
      expect(hyvelet.isdestroyed).to eq false
    }
  end

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
    it {
      expect(Hyvelet.get_missing.size).to eq 1
    }
  end

  describe '#get destroyed' do
    it {
      expect(Hyvelet.get_destroyed.size).to eq 1
    }
  end

  describe '#get my missing' do
    it {
      expect(Hyvelet.get_my_missing(hyvelet.user).size).to eq 1
    }
  end

  describe '#get my destroyed' do
    it {
      expect(Hyvelet.get_my_destroyed(hyvelet.user).size).to eq 1
    }
  end

end
