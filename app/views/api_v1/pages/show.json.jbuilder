json.place @place, :shop_name, :created_at, :address, :latitude, :longitude do
json.place do
    json.photo place.photos
end