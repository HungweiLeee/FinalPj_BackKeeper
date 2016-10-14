class AddOrderIdToReservation < ActiveRecord::Migration[5.0]
  def change
  	add_column :reservations, :order_id, :string, :default => "11111111"
  end
end
