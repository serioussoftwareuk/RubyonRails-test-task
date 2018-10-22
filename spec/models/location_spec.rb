require 'rails_helper'

RSpec.describe Location, type: :model do
  context '#address' do

    let! :location do
      create :location,
             street: '834 Florida St',
             city: 'San Francisco',
             state: 'CA',
             country: 'USA',
             zip: '94110'
    end

    it 'concatenates full address' do
      expect(location.address).to eq '834 Florida St, San Francisco, CA, USA, 94110'
    end
  end
end
