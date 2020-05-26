class CreateOrder
  def initialize(strong_params)
    @params = strong_params
    @shipping_params = strong_params[:shipping]
    @billing_params = strong_params[:billing]
    @products_params = strong_params[:productTab]
  end

  def call
    ActiveRecord::Base.transaction do
      order = Order.from_dto(@params)

      order.shipping_address = Address.from_dto(@shipping_params)
      order.billing_address = Address.from_dto(@billing_params)

      order.products << @products_params.map { |p| Product.from_dto(p) }

      order.save
    end
  end
end