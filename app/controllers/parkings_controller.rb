class ParkingsController < ApplicationController
    before_action :set_parking, only: %i[ show update destroy out paymant]
  
    def index
      @parkings = Parking.all
    end
  
    def show
    end
  
    def create
        @parking = ParkingEntryService.new.call(parking_params)
    
        if @parking[:status] ==  :success
          render json: @parking , status: :created
        else
          render json: @parking, status: :unprocessable_entity
        end
    end

    def out
        @parking_result_out = ParkingOutService.new.call(@parking)

        if @parking_result_out[:status] ==  :success
            render json: @parking_result_out , status: :created
        else
            render json: @parking_result_out, status: :unprocessable_entity
        end 
    end

    def paymant
        @parking_result_pay = ParkingPayService.new.call(@parking)

        if @parking_result_pay[:status] ==  :success
            render json: @parking_result_pay , status: :created
        else
            render json: @parking_result_pay, status: :unprocessable_entity
        end 
    end

    def historic

    end
  

    private
      def set_parking
        @parking = Parking.find(params[:id])
      end
  
      def parking_params
        params.require(:parking).permit(:plate, :paid)
      end
  end
  