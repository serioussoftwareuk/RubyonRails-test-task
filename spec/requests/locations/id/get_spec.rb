require 'rails_helper'

RSpec.describe 'GET /locations/:id', type: :request do
  def make_request
    get "/locations/#{id}"
  end

  let!(:location) { create :location }

  context 'when location exists' do
    let(:id) { location.id }

    before { make_request }

    it 'returns a success response' do
      expect(response).to be_successful
    end
  end

  context 'when location does not exist' do
    let(:id) { 'does-not-exist' }

    it 'returns a success response' do
      expect { make_request }.to raise_exception(ActiveRecord::RecordNotFound)
    end
  end
end
