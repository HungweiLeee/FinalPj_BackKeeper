class UsersController < ApplicationController
	def show
		@user = User.find_by_id(params[:id])
		@places = @user.places
	end
end