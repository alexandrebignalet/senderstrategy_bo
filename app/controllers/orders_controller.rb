class OrdersController < ApplicationController
  skip_before_action :verify_authenticity_token
  respond_to :json

  def create
    order = CreateOrder.new(params).call
    render json: [{ idOrders: order.id }], status: :created
  end
end
