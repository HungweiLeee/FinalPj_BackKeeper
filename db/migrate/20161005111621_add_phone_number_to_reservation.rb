class AddPhoneNumberToReservation < ActiveRecord::Migration[5.0]
  def change
  	add_column :reservations, :phone_number, :integer
  end
end
