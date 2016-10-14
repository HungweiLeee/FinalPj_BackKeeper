class PagesController < ApplicationController
  
  def index
  	@q = Place.ransack(params[:q])
  	@R_places = @q.result
  end

  def home
  	@places = Place.all.order("id DESC")
  end

  def show
  	@place = Place.find(params[:id])
  end

  def search

		if params[:search].present? && params[:search].strip != ""
			p = params[:search]
		end

		if p && p != ""
			@places_address = Place.near(p, 1500, order: 'distance').limit(5)
		else
			byebug
			@places_address = Place.all
		end


		@search = @places_address.ransack(params[:q])
		@places = @search.result
		@arrPlaces = @places.to_a

	end


  
end
