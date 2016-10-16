class Place < ApplicationRecord

	belongs_to :user
	has_many :photos, :dependent => :destroy

	geocoded_by :address
	after_validation :geocode, if: ->(obj){ obj.address.present? and obj.address_changed? }

	reverse_geocoded_by :latitude, :longitude
	after_validation :reverse_geocode, if: ->(obj){ obj.address.present? and obj.address_changed? }

	has_many :reservations

	has_many :reviews

	def average_rating
		reviews.count == 0 ? 0 : reviews.average(:star).round(2)
	end

	def check_big_bag(total_reservations)
	 	total = 0
	 	
    total_reservations.each do |b| 
      total = total + b.big_bags_for_thistime
    end
    return total
	 end

	 def check_small_bag(total_reservations)
	 	total = 0
	 	
    total_reservations.each do |b| 
      total = total + b.small_bags_for_thistime
    end
    return total
	 end
	
end
