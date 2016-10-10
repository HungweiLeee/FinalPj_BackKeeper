class AddColumnToReservationStatus < ActiveRecord::Migration[5.0]
  def change
  	add_column :reservation_statuses, :bag_status, :string
  end
end
