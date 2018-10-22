class LocationGeocoderWorker
  include Sidekiq::Worker

  def perform(location_id)
    location = Location.find(location_id)
    Location::GEOCODER_STREET_SERVICES_LIST.each do |lookup|
      location.lookup = lookup
      return location.save! if location.geocode
    end
  end
end
