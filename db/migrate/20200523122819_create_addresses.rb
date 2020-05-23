class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :name_original
      t.string :street_original
      t.string :code
      t.string :town
      t.string :country
      t.string :delivery_phone
      t.string :email
      t.string :address_note

      t.timestamps
    end
  end
end
