class ApiV1::ReservationsController < ApiController

  before_action :authenticate_user_from_token!
  before_action :find_place, :only => [:index, :show]

	def index
    #@reservations = current_user.reservations
    #render :json => @reservations.to_json
  end

  def show
    @reservation = @reservation.find(params[:id])
    render :json => @reservation.to_json
  end
 
  def create
    @reservation = Reservation.new( :start_time => params[:start_time],
                                    :end_time => params[:end_time],
                                    :big_bags_for_thistime => params[:big_bags_for_thistime],
                                    :small_bags_for_thistime => params[:small_bags_for_thistime])
 
    render :json => @reservation.to_json

    if @reservation.save
    	#render :json => { :message => "OK"}
    else
    	#render :json => { :errors => @reservation.errors.full_messages }, :status => 400
    end
  end


  private 

  def find_place
    @reservations = current_user.reservations
  end

end
