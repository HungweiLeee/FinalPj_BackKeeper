class AddUserIdAndPlaceIdToReservations2 < ActiveRecord::Migration[5.0]
  def change
  	add_column :reservations, :user_id, :integer
  	add_column :reservations, :place_id, :integer
  end
end
