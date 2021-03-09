class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name,                  null:false
      t.text :info,                    null:false
      t.references :user,              null:false
      t.integer :category_id,          null:false
      t.integer :price,                null:false
      t.integer :item_status_id,       null:false
      t.integer :prefecture_id,        null:false
      t.integer :delivary_date_id,      null:false
      t.integer :delivary_price_id,    null:false
      t.timestamps
    end
  end
end
