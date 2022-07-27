require 'rails_helper'

RSpec.describe "Sessions", type: :request do
    
    describe "POST /api/v1/sessions" do
        context 'succesful login' do
            before do
                post '/api/v1/sign_up', params: {sign_up:{ email: "jaime", password: "123"}}
                post '/api/v1/sessions', params: {sessions: { email: "jaime", password: "123"}}
            end

            it "return created status code" do
                expect(response).to have_http_status(:created)
            end

            it "returns a token" do
                expect(json['access_token']).not_to be_nil
            end
        end

        context 'login failed user' do
            before do
                post '/api/v1/sign_up', params: {sign_up:{ email: "jaime", password: "123"}}
                post '/api/v1/sessions', params: {sessions:{ email: "noexiste", password: "123"}}
            end

            it "returns  forbidden status code" do
                expect(response).to have_http_status(:not_found)
            end

            it "returns errors message" do
                expect(json['message']).to eq("Couldn't find User")
            end
        end

        context 'login failed password' do
            before do
                post '/api/v1/sign_up', params: {sign_up:{ email: "jaime", password: "123"}}
                post '/api/v1/sessions', params: {sessions:{ email: "jaime", password: "123123"}}
            end

            it "returns  forbidden status code" do
                expect(response).to have_http_status(:not_found)
            end

            it "returns errors message" do
                expect(json['errors']).to eq("usuario invalido")
            end
        end

    end
end