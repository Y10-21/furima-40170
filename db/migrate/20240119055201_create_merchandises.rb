class CreateMerchandises < ActiveRecord::Migration[7.0]
  def change
    create_table :merchandises do |t|
      t.string  :name,             null: false, default: ""
      t.text    :explanation,      null: false
      t.integer :category_id,      null: false, default: nil
      t.integer :condition_id,     null: false, default: nil
      t.integer :shipping_load_id, null: false, default: nil
      t.integer :prefecture_id,    null: false, default: nil
      t.integer :shipping_day_id,  null: false, default: nil
      t.integer :price,            null: false, default: nil
      t.references :user,          null: false,foreign_key: true
      t.timestamps
    end
  end
end
