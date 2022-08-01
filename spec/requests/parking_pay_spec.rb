require "rails_helper"

RSpec.describe "Parkings management pay", :type => :request do
    let(:valid_params) { Parking.create(paid: false) }

    context 'when you make the payment' do
        it "should return created http status when paid" do
            headers = {"ACCEPT" => "application/json"}
            get "/paymant/#{valid_params.id}"
            expect(response).to have_http_status(:created)
        end
    end


end