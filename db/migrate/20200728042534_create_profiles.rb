class CreateProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :profiles do |t|
      t.string :country
      t.string :street
      t.string :suburb
      t.string :state
      t.string :postcode
      t.string :website
      t.string :contact
      t.references :account, null: false, foreign_key: true

      t.timestamps
    end
  end
end
