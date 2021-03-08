class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.integer     :prefectures_id,     null: false
      t.string      :streetadoress,      null: false
      t.string      :postalcade,         null: false
      t.string      :cities,             null: false
      t.string      :buildname,          null: true
      t.string      :phonename,          null: false
      #t.references  :order,              null: false
      t.timestamps
    end
  end
end
