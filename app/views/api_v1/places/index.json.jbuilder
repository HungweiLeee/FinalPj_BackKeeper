json.data @places do |place|
  json.partial! "show", collection: @places, :as => :place
end
