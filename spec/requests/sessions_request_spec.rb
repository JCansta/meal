require 'rails_helper'

RSpec.describe "Sessions", type: :request do
    
    describe "GET /api/v1/sessions" do
        context 'succesful login' do
            before do
                post '/api/v1/sessions', params: { email: "brayitan", password: "123"}
            end

            it "return created status code" do
                expect(response).to have_http_status(:created)
            end

            it "returns a token" do
                expect(json['access_token']).not_to be_nil
            end
        end

        context 'login failed' do
            before do
                post '/api/v1/sessions', params: { email: "noexiste", password: "123"}
            end

            it "returns  forbidden status code" do
                expect(response).to have_http_status(:forbidden)
            end

            it "returns errors message" do
                expect(json['errors']).to eq("usuario invalido")
            end
        end

    end
end