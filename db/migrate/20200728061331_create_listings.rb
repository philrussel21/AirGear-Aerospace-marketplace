class CreateListings < ActiveRecord::Migration[6.0]
  def change
    create_table :listings do |t|
      t.references :category, null: false, foreign_key: true
      t.references :account, null: false, foreign_key: true
      t.string :part_num
      t.string :part_name
      t.float :selling_price
      t.string :currency
      t.string :serial_num
      t.integer :condition
      t.string :form_cert
      t.date :cert_date
      t.date :expiry_date
      t.integer :quantity
      t.text :description

      t.timestamps
    end
  end
end
