class OrdersController < ApplicationController
  skip_before_action :verify_authenticity_token
  respond_to :json

  def create
    ActiveRecord::Base.transaction do
      order = Order.from_dto(params)

      order.shipping_address = Address.from_dto(params[:shipping])
      order.billing_address = Address.from_dto(params[:billing])

      order.products << params[:productTab].map { |p| Product.from_dto(p) }

      order.save
    end

    head :created
  end
end
