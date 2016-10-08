class CreateReservationStatuses < ActiveRecord::Migration[5.0]
  def change
    create_table :reservation_statuses do |t|
    	t.string :type

      t.timestamps
    end

    add_column :reservations, :reservation_status_id, :integer
  end
end
