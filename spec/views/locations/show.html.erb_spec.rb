require 'rails_helper'

RSpec.describe "locations/show", type: :view do
  before(:each) do
    assign(:location, FactoryBot.create(:location, city: 'Houston', country: 'USA' ))
  end

  it "renders an address" do
    render

    expect(rendered).to match /Houston/
    expect(rendered).to match /USA/
  end
end
