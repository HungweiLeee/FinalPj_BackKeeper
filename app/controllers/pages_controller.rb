class PagesController < ApplicationController
  def home
  end

  def index
  	@places = Place.all
  end

  def show
  	@palce = Place.find(params[:id])
  end
  
end
