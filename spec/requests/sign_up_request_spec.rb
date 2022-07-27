require 'rails_helper'

RSpec.describe "SignUp", type: :request do
    
    describe "POST /api/v1/sign_up" do
        context 'succesful sign up' do
            before do
                post '/api/v1/sign_up', params: {sign_up:{ email: "jaimecastro@hotmail.com", password: "123"}}
            end

            it "return created status code" do
                expect(response).to have_http_status(:created)
            end

            it "returns a token" do
                expect(json['access_token']).not_to be_nil
            end
        end

        context 'sign up failed' do
            before do
                post '/api/v1/sign_up', params: {sign_up:{ email: "jaimecastro@hotmail.com", password: ""}}
            end

            it "returns forbidden status code" do
                expect(response).to have_http_status(:not_found)
            end

            it "returns errors message" do
                expect(json['message']).to eq("Validation failed: Password can't be blank")
            end
        end

    end
end