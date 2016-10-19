json.place @place, :shop_name, :created_at, :address, :latitude, :longitude
json.place do
     place.photos[0].image.url
end