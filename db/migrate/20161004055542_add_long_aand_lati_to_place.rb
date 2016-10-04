class AddLongAandLatiToPlace < ActiveRecord::Migration[5.0]
  def change
    add_column :places, :latitude, :string
    add_column :places, :longitude, :string
  end
end
