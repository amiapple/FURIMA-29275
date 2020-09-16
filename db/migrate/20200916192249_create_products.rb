class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string:name,             null: false, default: ""
      t.integer:price,           null: false
      t.integer:category,        null: false
      t.text:introduction,       null: false
      t.integer:condition,       null: false
      t.integer:postage,         null: false
      t.integer:shipping_area,   null: false
      t.integer:preparation_day, null: false
      t.integer:user_id,         foreign_key:true

      t.timestamps
    end
  end
end
