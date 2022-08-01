class ParkingEntryService
    
    def call(params)
        @params = params
        
        return  { status: :error, message: "Invalid plate format" } unless is_valid_plate(@params[:plate])

        @parking = Parking.new(@params)

        if @parking.save
            return  { status: :success, message: "Input successfully performed", "id": @parking.id }
        else
            return  { status: :error, message: "There was an error while making the entry"} 
        end
    end
    
    def is_valid_plate(plate)
        return false unless plate.present?
        plate.match?(/[a-zA-Z]{3}[0-9]{4}/i)
    end
end
  