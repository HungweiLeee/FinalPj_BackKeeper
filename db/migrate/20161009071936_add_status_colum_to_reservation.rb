class AddStatusColumToReservation < ActiveRecord::Migration[5.0]
  def change
  	add_column :reservations, :status, :string, :default => "待寄放"
  end
end
