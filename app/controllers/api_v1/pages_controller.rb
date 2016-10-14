class ApiV1::PagesController < ApiController

	def index
  	@places = Place.all
  end

  def show
  	@place = Place.find(params[:id])
  end

  def get_nearby
  	@places = Place.near([params[:latitude], params[:longitude]], 20).limit(5)
  end
  #Place.near([25.0039, 121.202], 10).limit(3)
end