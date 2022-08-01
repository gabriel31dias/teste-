require "rails_helper" 
describe ParkingEntryService do
    let(:valid_params) { { parking: {"plate": "AAA3343"} } }
    let(:incorrect_params) { { parking: {"plate": "xxxxxxxxxxx"} } }
      
    it "should return success when mask is valid" do
        result = subject.call(valid_params[:parking])
        expect(result[:message]).to eq("Input successfully performed")
    end

    it "should return error when mask invalid" do
        result = subject.call(incorrect_params[:parking])
        expect(result[:message]).to eq("Invalid plate format")
    end
end