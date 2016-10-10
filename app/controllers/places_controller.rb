class PlacesController < ApplicationController

  before_action :find_place, :only => [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, :except => [:index]

  def index
    @places = current_user.places.order('created_at DESC')

    #@wait_to_place_reservations = 
    #@wait_to_take_reservations
    #@completed_reservations

  end

  def show
    @photos = @place.photos
    @shop_reservations = @place.reservations
  end

  def new
    @place = current_user.places.new
  end

  def edit
    if current_user.id == @place.user_id
      @photos = @place.photos
    else
      redirect_to root_path, notice: "No permission"
    end
  end

  def create
    @place = current_user.places.build(place_params)

    if @place.save
      if params[:images]
        params[:images].each do |image|
          @place.photos.create(image: image)
        end
      end

      @photos = @place.photos
      redirect_to edit_place_path(@place), notice: "Saved!"
    else
      render :new
    end

  end

  def update
    if @place.update(place_params)

      if params[:images]
        params[:images].each do |image|
          @place.photos.create(image: image)
        end
      end

      redirect_to edit_place_path(@place), notice: "Updated!"
    else
      render :edit
    end
  end

  def destroy
    if @place.destroy
      redirect_to places_path, notice: "deleted!"
    end
  end


  private 

  def place_params
    params.require(:place).permit(:shop_name, :address, :summary, :big_bag, :small_bag)
  end

  def find_place
    @place = Place.find(params[:id])
  end

end
