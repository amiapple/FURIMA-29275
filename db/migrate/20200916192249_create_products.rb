class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string:name,             null: false, default: ""
      t.integer:price,           null: false
      t.integer:category_id,        null: false
      t.text:introduction,       null: false
      t.integer:condition_id,       null: false
      t.integer:postage_id,         null: false
      t.integer:shipping_area_id,   null: false
      t.integer:preparation_day_id, null: false
      t.integer:user_id,         foreign_key:true


      t.timestamps
    end
  end
end

