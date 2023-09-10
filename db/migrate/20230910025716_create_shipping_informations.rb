class CreateShippingInformations < ActiveRecord::Migration[6.0]
  def change
    create_table :shipping_informations do |t|
      t.string :postal_code, null: false 
      t.integer :region_id, null: false
      t.string :city,null: false
      t.string :address_number, null: false 
      t.string :building, null: false 
      t.string :tel_number, null: false 
      t.references :order, null: false, foreign_key: true 
      t.timestamps
    end
  end
end
