class Place < ApplicationRecord

	belongs_to :user
	has_many :photos, :dependent => :destroy

	geocoded_by :address
	after_validation :geocode, if: ->(obj){ obj.address.present? and obj.address_changed? }

	reverse_geocoded_by :latitude, :longitude
	after_validation :reverse_geocode, if: ->(obj){ obj.address.present? and obj.address_changed? }

	has_many :reservations

	has_many :reviews

	def check_bag_status
	end

	def average_rating
		
	end
	
end
