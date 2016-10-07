class PagesController < ApplicationController
  def home
  	@places = Place.all
  end

  def show
  	@palce = Place.find(params[:id])
  end
  
end
