class PagesController < ApplicationController
  def home
  	@places = Place.all.order("id DESC")
  end

  def show
  	@palce = Place.find(params[:id])
  end

  def search
		
	end
  
end
