class CreatePlaces < ActiveRecord::Migration[5.0]
  def change
    create_table :places do |t|
      t.string :shop_name
      t.string :address
      t.integer :user_id
      t.text :summary
      t.integer :big_bag
      t.integer :small_bag

      t.timestamps
    end
  end
end
