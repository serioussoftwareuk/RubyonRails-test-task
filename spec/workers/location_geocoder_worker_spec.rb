require 'rails_helper'
require 'sidekiq/testing'
RSpec.describe LocationGeocoderWorker, type: :worker do
  let!(:location) { create :location }

  it 'creates a job' do
    expect {
      LocationGeocoderWorker.perform_async(location.id)
    }.to change(LocationGeocoderWorker.jobs, :size).by(1)
  end

  it 'gets location coordinates' do
    Sidekiq::Testing.inline! do
      LocationGeocoderWorker.perform_async(location.id)
      expect(location.reload.latitude).not_to be_nil
      expect(location.reload.longitude).not_to be_nil
    end
  end
end
