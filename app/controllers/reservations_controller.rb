class ReservationsController < ApplicationController

	before_action :authenticate_user!

  def create
  	@reservation = current_user.reservations.create(reserv_params)

  	if @reservation
			flash[:notice]="預約成功!"
		end

  	redirect_to places_path(@place)
  end



  def your_trips
  	@trips = current_user.reservations
  end

	private

	def reserv_params
		params.require(:reservation).permit(:start_time, :end_time, :price, :total, :place_id)
	end
end