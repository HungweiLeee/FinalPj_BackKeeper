class AddCurrentBagCapacityAndPhoneNumber < ActiveRecord::Migration[5.0]
  def change
  	add_column :reservations, :phone, :string
  	add_column :places, :currnet_big_capacity, :integer
  	add_column :places, :currnet_small_capacity, :integer
  end
end
