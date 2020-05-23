class Order < ApplicationRecord
  belongs_to :shipping_address, class_name: 'Address', foreign_key: 'shipping_address_id'
  belongs_to :billing_address, class_name: 'Address', foreign_key: 'billing_address_id', optional: true
  has_many :products

  def self.from_dto(params)
    Order.new(id_distributors: params[:idDistributors],
              payment_method: params[:paymentMethod],
              transaction_id: params[:transactionId],
              transaction_mode: params[:transactionMode],
              transaction_state: params[:transactionState],
              transaction_percent: params[:transactionPercent],
              tva_reference: params[:tvaReference],
              import_url: params[:importUrl],
              coupon: params[:coupon],
              amount: params[:amount],
              god_father: params[:godFather],
              shipping_direct: params[:shippingDirect],
              is_shipped: params[:isShipped],
              how_known: params[:howKnown])
  end
end
