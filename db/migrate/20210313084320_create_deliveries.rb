class CreateDeliveries < ActiveRecord::Migration[6.0]
  def change
    create_table :deliveries do |t|
      t.references :order, foreign_key: true
      t.string :delivery_mail_num, null: false, default: ""
      t.integer :delivery_area_id
      t.string :delivery_shikutyouson, null: false, default: ""
      t.string :delivery_numbering, null: false, default: ""
      t.string :delivery_building_name
      t.string :delivery_telephone, null: false, default: ""
      t.timestamps
    end
  end
end
