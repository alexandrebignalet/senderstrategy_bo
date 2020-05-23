class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.string :id_distributors
      t.string :payment_method
      t.string :transaction_id
      t.string :transaction_mode
      t.string :transaction_state
      t.string :transaction_percent
      t.string :tva_reference
      t.string :import_url
      t.string :coupon
      t.string :amount
      t.string :god_father
      t.boolean :shipping_direct
      t.boolean :is_shipped
      t.string :how_known

      t.timestamps
    end
  end
end
