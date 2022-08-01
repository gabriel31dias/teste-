class ParkingOutService
   
    def call(parking)
        @parking = parking
        
        return  { status: :error, message: "You can't leave without paying" } if @parking.paid == false
        
        if @parking.update(left: true)
            return  { status: :success, message: "Exit executed successfully" }
        else
            return  { status: :error, message: "An error occurred while exiting" }
        end
    end
end