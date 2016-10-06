class PhotosController <ApplicationController

	def destroy
		@photo = Photo.find(params[:id])
		place = @photo.place

		@photo.destroy
		@photos = Photo.where(:place_id => place_id)

		respond_to :js
	end
end