class ApiV1::PlacesController < ApiController
  
  before_action :authenticate_user!
  
	def index
    #@places = Place.all.order("id DESC")
    @places = current_user.places.order("id DESC")

    # render :json => @places.to_json

    # result = {}

    # @places.each do |p|
    #   h = { :shop_name => p.shop_name, :address => p.address }
    #   result[p.id.to_s.to_sym] = h
    # end

    # render :json => result.to_json
  end

  def show
    @place = Place.find(params[:id])

    render :json => @place.to_json
  end
 
  def create
    @place = Place.new( :shop_name => params[:shop_name] )
 
    if @place.save
    	render :json => { :message => "OK", :id => @place.id }
    else
    	render :json => { :errors => @place.errors.full_messages }, :status => 400
    end
  end
end
