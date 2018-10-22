require 'rails_helper'

RSpec.describe LocationsImport, type: :interactor do
  subject :context do
    described_class.call(
      file: file
    )
  end

  let(:file) { fixture_file_upload("#{::Rails.root}/spec/fixtures/files/locations_import.csv", 'text/csv') }

  describe '#process_import' do
    it 'succeeds' do
      expect(context).to be_a_success
    end

    let!(:last_created_location) { context.location }

    it 'provides the location' do
      expect(last_created_location).to be_persisted
    end

    it 'provides created location has correct attributes' do
      expect(last_created_location.street).to eq '2106 2nd Ave'
      expect(last_created_location.city).to eq 'Seattle'
      expect(last_created_location.state).to eq 'WA'
      expect(last_created_location.country).to eq 'USA'
      expect(last_created_location.zip).to eq '98121'
    end
  end
end

