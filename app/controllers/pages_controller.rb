class PagesController < ApplicationController
  
  def home
  	@places = Place.all.order("id DESC")
  end

  def show
  	@palce = Place.find(params[:id])
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
