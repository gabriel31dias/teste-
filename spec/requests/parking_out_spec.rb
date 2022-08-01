require "rails_helper"

RSpec.describe "Parkings management out", :type => :request do
    let(:valid_params) { Parking.create(paid: true) }
    let(:incorrect_params) { Parking.create(paid: false) }

    context 'if it s paid' do
        it "should return created http status when paid" do
            headers = {"ACCEPT" => "application/json"}
            get "/out/#{valid_params.id}"
            expect(response).to have_http_status(:created)
        end
    end

    context 'if not paid' do
        it "should return http unprocessable_entity status when not paid" do 
            headers = {"ACCEPT" => "application/json"}
            get "/out/#{incorrect_params.id}"
            expect(response).to have_http_status(:unprocessable_entity)
        end
    end
   
end