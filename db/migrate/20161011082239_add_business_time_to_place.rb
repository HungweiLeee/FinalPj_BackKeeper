class AddBusinessTimeToPlace < ActiveRecord::Migration[5.0]
  def change
  	add_column :places, :business_time, :datetime
  end
end
