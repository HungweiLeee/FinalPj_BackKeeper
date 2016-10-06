class ApiV1::ReservationsController < ApplicationController

	def index
    @reservations = Reservation.all
    render :json => @reservations.to_json
  end

  def show
    @reservation = Reservation.find(params[:id])

    render :json => @reservation.to_json
  end
 
  def create
    @reservation = Reservation.new( :start_time => params[:start_time],
                                    :end_time => params[:end_time],
                                    :big_bags_for_thistime => pareams[:big_bags_for_thistime],
                                    :small_bags_for_thistime => pareams[:small_bags_for_thistime])
 
    if @reservation.save
    	render :json => { :message => "OK"}
    else
    	render :json => { :errors => @reservation.errors.full_messages }, :status => 400
    end
  end
end
end
