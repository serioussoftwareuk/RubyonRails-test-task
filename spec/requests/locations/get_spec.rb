require 'rails_helper'

RSpec.describe 'GET /', type: :request do
  def make_request
    get '/'
  end

  before { make_request }

  context 'returns a success response' do
    it 'returns a success response' do
      expect(response).to be_successful
    end
  end
end
