# frozen_string_literal: true

class OrdersController < ApplicationController
  skip_before_action :verify_authenticity_token
  respond_to :json

  def create
    order = CreateOrder.new(params).call
    render json: [{ idOrders: order.id }], status: :created
  end

  def checkout
    session = CheckoutOrder.new(checkout_params).call
    render json: { session: session }, status: :created
  end

  private

  def checkout_params
    params.permit(:name, :description, :locale,
                  :email, :amount, :currency,
                  :quantity, :idOrders, :successUrl,
                  :errorUrl)
  end
end
