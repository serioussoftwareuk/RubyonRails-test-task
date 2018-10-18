require 'csv'

class LocationsImport
  include Interactor

  def call
    validate_file

    process_import
  end

  private

  delegate :file, to: :context

  def validate_file
    context.fail!(error: 'CSV error') if file.content_type != 'text/csv'
  end

  def process_import
    CSV.foreach(file.path, { headers: true, header_converters: :symbol} ) do |row|
      location = Location.create!(
        country: row[:country],
        state: row[:state],
        city: row[:city],
        zip: row[:zip],
        street: row[:street],
        lookup: Location::GEOCODER_STREET_SERVICE.first
      )
      location.geocode
      location.save if location.geocoded?
    end
  end
end
