class ApiV1::PagesController < ApiController

	def index
  	@places = Place.all
  end

  def show
  	@place = Place.find(params[:id])
  end

end