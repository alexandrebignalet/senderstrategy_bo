class AddShippingAddressIdToOrders < ActiveRecord::Migration[5.2]
  def change
    add_reference :orders, :shipping_address_id, foreign_key: true
  end
end
