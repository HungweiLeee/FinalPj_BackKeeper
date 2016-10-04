class Place < ApplicationRecord

	belongs_to :user
	has_many :photos, :dependent => :destroy

	geocoded_by :address
	after_validation :geocode, if: ->(obj){ obj.address.present? and obj.address_changed? }

	has_many :reservations
	
end
