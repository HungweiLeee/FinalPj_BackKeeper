class AddStartAndEndDateToReservation < ActiveRecord::Migration[5.0]
  def change
  	add_column :reservations, :start_date, :datetime
  	add_column :reservations, :end_date, :datetime
  end
end
