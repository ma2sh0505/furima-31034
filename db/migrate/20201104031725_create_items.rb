class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name,                null: false
      t.text :introduction,          null: false
      t.integer :category_id,        null: false
      t.integer :condition_id,       null: false
      t.integer :price,              null: false
      t.integer :delivery_area_id,   null: false
      t.integer :delivery_burden_id, null: false
      t.integer :delivery_day_id,    null: false
      t.references :user,    foreigin_key: true
      t.timestamps
    end
  end
end
