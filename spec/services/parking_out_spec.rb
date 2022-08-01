
require "rails_helper" 
describe ParkingOutService do
    let(:valid_params) { Parking.create(paid: true) }
    let(:incorrect_params) { Parking.create(paid: false) }
      
    it "should return success if paid when exiting" do
        result = subject.call(valid_params)
        expect(result[:message]).to eq("Exit executed successfully")
    end

    it "should return error if not paid on exit" do
        result = subject.call(incorrect_params)
        expect(result[:message]).to eq("You can't leave without paying")
    end
end