class Location < ApplicationRecord
  # Geocoder::Lookup.street_services - [:test]
  GEOCODER_STREET_SERVICE = %i[nominatim here baidu yandex]

  geocoded_by :address, lookup: lambda{ |obj| obj.geocoder_street_service }

  def address
    [street, city, state, country, zip].compact.join(', ')
  end

  def geocoder_street_service
    GEOCODER_STREET_SERVICE.first
  end
end
