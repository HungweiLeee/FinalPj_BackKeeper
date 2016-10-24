class ApiV1::ReservationsController < ApiController

  before_action :authenticate_user_from_token!
  before_action :find_place, :only => [:index, :show, :edit]

	def index
    #@reservations = current_user.reservations
    #render :json => @reservations.to_json
  end

  def show
    @reservation = Reservation.find(params[:id])
    render :json => @reservation.to_json
  end
 
  def create
    @reservation = Reservation.create( 
                                    # :place_id => params[:place_id],
                                    :start_time => params[:start_time],
                                    :end_time => params[:end_time],
                                    :big_bags_for_thistime => params[:big_bags_for_thistime],
                                    :small_bags_for_thistime => params[:small_bags_for_thistime],
                                    :phone => params[:phone]                                 
                                  )
    @reservation.user = current_user
    @reservation.place = Place.find(params[:place_id])
    @reservation.save

    order = @reservation.created_at.to_s  #=> "2016-10-14 04:16:42 UTC"
    n = order.size

    pos = @reservation.phone.last(4)

    id = order[5..n-14] + pos

    @reservation.update(:order_id => id)

    @reservation.save

    #UserMailer.notify_comment(current_user, reservation).deliver_later!

    #flash[:notice]="預約成功!"
    #@reservation.place_id = Reservation.find(params[:id])
    render :json => @reservation.to_json


    
  end

  def update
    @reservation = @reservation.update(reservation_params)

    if @reservtion.save
      render :json => { :message => "OK"}
    else
      render :json => { :errors => @reservation.errors.full_messages }, :status => 400
    end

  end


  private 

  def find_place
    @reservations = current_user.reservations
  end

  def reservation_params

  end

end
