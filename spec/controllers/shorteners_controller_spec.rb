require 'rails_helper'
RSpec.describe ShortenersController, type: :controller do

  let(:valid_attributes) {
    { url: 'http://www.test.com' }
  }

  describe "GET #new" do
    it "returns a success response" do
      get :new, params: {}
      expect(response).to be_success
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Shortener" do
        expect {
          post :create, params: valid_attributes, xhr: true
        }.to change(Shortener.paths, :count).by(1)
      end

      it "returns a success status code" do
        post :create, params: {shortener: valid_attributes}, xhr: true
        expect(response).to be_success
      end
    end
  end
end
