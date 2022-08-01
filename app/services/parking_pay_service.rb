class ParkingPayService

    def call(parking)
        @parking = parking

        return  { status: :error, message: "It is already paid" } if @parking.paid == true

        if @parking.update(paid: true)
            return  { status: :success, message: "Successfully paid" }
        else
            return  { status: :error, message: "Error processing payment" }
        end
    end
   
end