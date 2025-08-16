require 'rails_helper'

RSpec.describe "V1::Sessions", type: :request do
  describe "POST /v1/login" do
    let(:url) { "/v1/login" }
    let!(:user) { create(:user) }

    context "with valid credentials" do
      before do
        post url, params: { user: { email: user.email, password: user.password } }.to_json, headers: { 'Content-Type': 'application/json' }
      end

      it "returns a successful response" do
        expect(response).to have_http_status(:ok)
      end

      it "returns the user data" do
        expect(json_response['data']['email']).to eq(user.email)
      end

      it "returns a JWT in the Authorization header" do
        expect(response.headers['Authorization']).to be_present
        expect(response.headers['Authorization']).to start_with("Bearer ")
      end
    end

    context "with invalid credentials" do
      before do
        post url, params: { user: { email: user.email, password: "wrongpassword" } }.to_json, headers: { 'Content-Type': 'application/json' }
      end

      it "returns an unauthorized response" do
        expect(response).to have_http_status(:unauthorized)
      end

      it "does not return a JWT" do
        expect(response.headers['Authorization']).to be_nil
      end
    end
  end
end
