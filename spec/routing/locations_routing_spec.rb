require "rails_helper"

RSpec.describe LocationsController, type: :routing do
  describe "routing" do
    it do
      expect(get('/'))
        .to route_to("locations#index")
    end

    it do
      expect(post('/locations'))
        .to route_to('locations#create')
    end

    it do
      expect(get('/locations/:id'))
        .to route_to('locations#show', id: ':id',)
    end
  end
end
