require 'rails_helper'

RSpec.describe 'POST /locations', type: :request do
  def make_request
    post '/locations',
    params: params
  end

  let :params do
    {
      file: file
    }
  end

  before { make_request }

  context 'with valid params' do
    let(:file) { fixture_file_upload("#{::Rails.root}/spec/fixtures/files/locations_import.csv", 'text/csv') }

    it "create locations from file" do
      expect(Location.count).to eq(10)
    end

    it 'redirects to root path with success message' do
      expect(flash[:notice]).to eq 'Success!'
      expect(response).to redirect_to(root_path)
    end
  end

  context "with invalid params" do
    let(:file) { fixture_file_upload("#{::Rails.root}/spec/fixtures/files/image.png", 'image/png') }

    it "redirects to root path with error message" do
      expect(flash[:alert]).to eq 'CSV error!'
      expect(response).to redirect_to(root_path)
    end
  end
end
