class CreateSendingDestinations < ActiveRecord::Migration[6.0]
  def change
    create_table :sending_destinations do |t|
      t.integer :product_purchase_id, null: false, foreign_key:true
      t.string  :postal_code,         null: false
      t.integer :shipping_area_id,    null: false
      t.string  :city,                null: false
      t.string  :addresses,           null: false
      t.string  :building,            null: false
      t.string  :phone_number,        null: false
      t.timestamps
    end
  end
end
