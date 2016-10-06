json.data @reservations do |reservation|
  json.partial! "show", collection: @reservations, :as => :reservation
end