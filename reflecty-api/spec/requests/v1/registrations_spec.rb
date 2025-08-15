require 'rails_helper'

RSpec.describe "V1::Registrations", type: :request do
  describe "POST /v1/signup" do
    let(:url) { "/v1/signup" }
    let(:valid_params) { { user: attributes_for(:user) } }
    let(:invalid_params) { { user: attributes_for(:user, email: "") } }

    context "with valid parameters" do
      it "creates a new user" do
        expect { post url, params: valid_params.to_json, headers: { 'Content-Type': 'application/json' } }.to change(User, :count).by(1)
        expect(response).to have_http_status(:ok)
        expect(json_response['status']['message']).to eq('Signed up successfully.')
      end
    end

    context "with invalid parameters" do
      it "does not create a new user" do
        expect { post url, params: invalid_params.to_json, headers: { 'Content-Type': 'application/json' } }.not_to change(User, :count)
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
