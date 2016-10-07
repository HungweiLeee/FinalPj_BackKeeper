class ReservationsController < ApplicationController

	#before_action :authenticate_user!

  #for ajax datepicker
  def preload
    room = Room.find(params[:room_id])
    today = Date.today
    reservations = room.reservations.where("start_date >= ? OR end_date >= ?", today, today)

    render json: reservations 
  end

  def index
    @reservations = current_user.reservations.all
    render :json => @reservations.to_json
  end

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
		params.require(:reservation).permit(:start_time, :end_time, :price, :total, :place_id, :big_bags_for_thistime, :small_bags_for_thistime)
	end
end