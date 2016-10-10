class Place < ApplicationRecord

	belongs_to :user
	has_many :photos, :dependent => :destroy

	geocoded_by :address
	after_validation :geocode, if: ->(obj){ obj.address.present? and obj.address_changed? }

	has_many :reservations

	has_many :reviews

	def check_bag_status
	end

	def average_rating
		reviews.counts == 0 ? 0 : reviews.average(:star).round(2)
	end
	
end
