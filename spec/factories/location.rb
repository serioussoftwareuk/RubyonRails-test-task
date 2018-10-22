FactoryBot.define do
  factory :location do
    street  { Faker::Address.street_address }
    city    { Faker::Address.city }
    state   { Faker::Address.state }
    country { Faker::Address.country }
    zip     { Faker::Address.zip_code }
    lookup  { Location::GEOCODER_STREET_SERVICES_LIST.sample }
  end
end
