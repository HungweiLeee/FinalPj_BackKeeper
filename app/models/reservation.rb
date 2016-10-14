class Reservation < ApplicationRecord

	belongs_to :user

	belongs_to :place

	#belongs_to :reservation_status
	
	def time_diff(start_time, end_time)
	  seconds_diff = (start_time - end_time).to_i.abs

	  hours = seconds_diff / 3600
	  seconds_diff -= hours * 3600

	  minutes = seconds_diff / 60
	  seconds_diff -= minutes * 60

	  seconds = seconds_diff

	  "#{hours.to_s.rjust(2, '0')}:#{minutes.to_s.rjust(2, '0')}:#{seconds.to_s.rjust(2, '0')}"
	 end

	 def check_big_bag (total_reservations)
	 	total = 0
	 	
    total_reservations.each do |b|
      total = total + b.big_bags_for_thistime
    end
	 end

end
