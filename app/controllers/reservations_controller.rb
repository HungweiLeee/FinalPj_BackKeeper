class ReservationsController < ApplicationController

	#before_action :authenticate_user!

  #for ajax datepicker

  before_filter :disable_nav, only: [:index]

  def landing_page
    @disable_nav = true
  end

  def preload
    place = Place.find(params[:place_id])
    today = Date.today
    reservations = place.reservations.where("start_date >= ? OR end_date >= ?", today, today)

    render :json => reservations 
  end

  def index
    @place = Place.find(params[:place_id])
    @reservations = @place.reservations
    @notifications = Notification.all.reverse

    @wait_to_put = @reservations.where(status: "待寄放")
    @wait_to_take = @reservations.where(status: "待取")
    @compeleted = @reservations.where(status: "完成")

    #@reservation = @place.reservations.find(params[:id])
    #@wait_for_take_reservations = @reservations
    #@compeleted_reservations = @reservations

    #render :json => @reservations.to_json
  end

  def create
  	@reservation = current_user.reservations.create(reserv_params)

    order = @reservation.created_at.to_s  #=> "2016-10-14 04:16:42 UTC"
    n = order.size

    pos = @reservation.phone.last(4)

    id = order[5..n-14] + pos

    @reservation.update(:order_id => id)

  	if @reservation
			flash[:notice]="預約成功!"

      UserMailer.notify_comment(current_user, order_id).deliver_later!
		end

  	redirect_to places_path(@place)
  end

  def edit
    @place = Place.find(params[:place_id])
  end

  def update

    @place = Place.find(params[:place_id])
    @reservation = @place.reservations.find(params[:id])
    @reservation.update(reserv_params)

    if @reservation
      flash[:notice]="更新成功!"
    end

    #UserMailer.notify_comment(@reservation).deliver_later!

    redirect_to place_reservations_path

  end

  def show
    @place = Place.find(params[:place_id])
    @reservation = @place.reservations.find(params[:id])

  end


  def your_trips
  	@trips = current_user.reservations
  end

	private

	def reserv_params
		params.require(:reservation).permit(:phone, :status, :start_time, :end_time, :price, :total, :place_id, :big_bags_for_thistime, :small_bags_for_thistime, :start_date, :end_date)
	end
end