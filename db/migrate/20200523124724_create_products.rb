class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :product_type
      t.string :product_category
      t.string :number
      t.string :pricing
      t.string :unit
      t.string :subtotal
      t.string :shipping
      t.string :total
      t.string :mode
      t.string :tax

      t.timestamps
    end
  end
end
