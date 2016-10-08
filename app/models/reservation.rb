class Reservation < ApplicationRecord

	belongs_to :user

	belongs_to :place

	belongs_to :reservation_status
	
end
