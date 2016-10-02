class PlacesController < ApplicationController

  before_action :find_place, :only => [:show, :edit, :update]
  before_action :authenticate_user!, :except => [:show]

  def index
    @places = current_user.places
  end

  def show
    #@place = currnet_user.find(:id)
    @photos = @place.photos
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

      redirect_to edit_place(@place), notice: "Updated!"
    else
      render :edit
    end
  end

  def dstroy
  end


  private 

  def place_params
    params.require(:place).permit(:shop_name, :adress, :summary, :big_bag, :small_bag)
  end

  def find_place
    @place = Place.find(params[:id])
  end

end
