require "rails_helper" 
describe ParkingPayService do
    let(:valid_params) { Parking.create(paid: false) }
    let(:incorrect_params) { Parking.create(paid: true) }

    it "should return success when paid" do
        result = subject.call(valid_params)
        expect(result[:message]).to eq("Successfully paid")
    end

    it "should return error when already paid" do
        result = subject.call(incorrect_params)
        expect(result[:message]).to eq("It is already paid")
    end

end