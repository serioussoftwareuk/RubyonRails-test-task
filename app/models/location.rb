class Location < ApplicationRecord
  GEOCODER_STREET_SERVICES_LIST = %i[nominatim dstk esri]

  geocoded_by :address, lookup: lambda{ |obj| obj.lookup.to_sym }

  def address
    [street, city, state, country, zip].compact.join(', ')
  end
end
