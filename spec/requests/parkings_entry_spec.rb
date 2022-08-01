require "rails_helper"

RSpec.describe "Parkings management create", :type => :request do
    let(:valid_params) { { parking: {"plate": "AAA3343"} } }
    let(:incorrect_params) { { parking: {"plate": "xxxxxxxxxxx"} } }

    context 'when its correct' do
       
        it "should return http created status when correct" do
            headers = {"ACCEPT" => "application/json"}
            post "/parkings", :params => valid_params
            expect(response).to have_http_status(:created)
        end

        it "should return this when valid" do
            headers = {"ACCEPT" => "application/json"}
            post "/parkings", :params => valid_params
            expect(response.parsed_body).to include 'message'
            expect(response.parsed_body).to include 'status'
        end
    end

    context 'when its incorrect' do

        it "should return http status unprocessable_entity when incorrect" do
            headers = {"ACCEPT" => "application/json"}
            post "/parkings", :params => incorrect_params
            expect(response).to have_http_status(:unprocessable_entity)
        end

        it "should return this as structure" do
            headers = {"ACCEPT" => "application/json"}
            post "/parkings", :params => valid_params
            expect(response.parsed_body).to include 'message'
            expect(response.parsed_body).to include 'status'
        end
    end

end