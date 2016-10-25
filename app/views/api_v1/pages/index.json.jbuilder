json.places @places do |place|
	json.place place, :id, :shop_name, :created_at, :address, :latitude, :longitude 
	json.photos place.photos do |photo|
		json.image_url photo.image.url
	end
end
#json.places @places, :place.id, :shop_name, :created_at, :address, :latitude, :longitude, :photos
