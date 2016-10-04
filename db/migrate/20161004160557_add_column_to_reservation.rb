class AddColumnToReservation < ActiveRecord::Migration[5.0]
  def change
  	add_column :reservations, :big_bags_for_thistime, :integer
    add_column :reservations, :small_bags_for_thistime, :integer
  end
end
