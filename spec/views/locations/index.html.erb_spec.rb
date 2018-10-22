require 'rails_helper'

RSpec.describe "locations/index", type: :view do
  before(:each) do
    assign(:locations, [
      FactoryBot.create(:location, city: 'Houston'),
      FactoryBot.create(:location, city: 'Chicago')
    ])
  end

  it "renders a list of locations" do
    render

    expect(rendered).to match /Houston/
    expect(rendered).to match /Chicago/
  end
end
