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
      expect(Hyvelet.get_missing).to eq 1
    }
  end

  describe '#get destroyed' do
    it {
      expect(Hyvelet.get_destroyed).to eq 1
    }
  end

  describe '#get my missing' do
    it {
      expect(Hyvelet.get_my_missing(user)).to eq 1
    }
  end

  describe '#get my destroyed' do
    it {
      expect(Hyvelet.get_my_destroyed(user)).to eq 1
    }
  end

  describe '#update lat lng' do
    it {
      expect(hyvelet.update_location(0.0, 0.0)).to eq 0.0, 0.0
    }
  end

  describe '#update name' do
    it {
      expect(hyvelet.update_name("Jim")).to eq "Jim"
    }
  end

end
