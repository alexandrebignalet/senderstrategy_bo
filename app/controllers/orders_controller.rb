class OrdersController < ApplicationController
  skip_before_action :verify_authenticity_token
  respond_to :json

  def create
    render json: CreateOrder.new(params).call, status: :created
  end
end
