class AddUserIdAndPlaceIdToReservations < ActiveRecord::Migration[5.0]
  def change
  	remove_column :reservations, :user_id, :integer
  end
end
