class AddBillingAddressIdToOrders < ActiveRecord::Migration[5.2]
  def change
    add_reference :orders, :billing_address_id, foreign_key: true, nullable: true
  end
end
