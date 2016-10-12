class ReviewsController < ApplicationController

	def create
		@review = current_user.reviews.create(review_params)
		redirect_to @review.place
		
	end

	def destroy
		@review = Review.find(params[:id])
		place = @review.place
		@review.destroy

	end

	private 

	def review_params
		params.require(:review).permit(:comment, :star, :place_id)
	end
end