require 'rails_helper'

RSpec.describe LocationsController, type: :controller do

  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }


  describe "GET #index" do
    it "returns a success response" do
      Location.create! valid_attributes
      get :index, params: {}
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      location = Location.create! valid_attributes
      get :show, params: {id: location.to_param}
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Location" do
        expect {
          post :create, params: {location: valid_attributes}, session: valid_session
        }.to change(Location, :count).by(1)
      end

      it "redirects to the created location" do
        post :create, params: {location: valid_attributes}, session: valid_session
        expect(response).to redirect_to(Location.last)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: {location: invalid_attributes}, session: valid_session
        expect(response).to be_successful
      end
    end
  end

end
