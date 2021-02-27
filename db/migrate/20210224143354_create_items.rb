class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.references :user, foreign_key: true
      t.string :name,null: false, default: ""
      t.text :detail,null: false
      t.integer :category_id,null: false
      t.integer :status_id,null: false
      t.integer :delivery_price_id,null: false
      t.integer :delivery_area_id,null: false
      t.integer :delivery_day_id,null: false
      t.integer :price,null: false
      t.timestamps
    end
  end
end
