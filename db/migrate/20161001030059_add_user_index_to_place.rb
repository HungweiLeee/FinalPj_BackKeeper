class AddUserIndexToPlace < ActiveRecord::Migration[5.0]
  def change
  	add_index :places, :user_id
  end
end
