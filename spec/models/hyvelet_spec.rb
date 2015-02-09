require 'rails_helper'

RSpec.describe Hyvelet, :type => :model do

	let(:hyvelet) { create(:hyvelet ) }
	it { should belong_to(:user) }

  describe '#missing' do
    expect(hyvelet.ismissing).to eq false
  end
  describe '#destroyed' do
    expect(hyvelet.isdestroyed).to eq false
  end

  describe '#toggle missing' do
    expect(hyvelet.toggle_missing).to eq true
  end
  describe '#toggle destroyed' do
    expect(hyvelet.toggle_destroyed).to eq true
  end

end
