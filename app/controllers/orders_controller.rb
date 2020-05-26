class OrdersController < ApplicationController
  skip_before_action :verify_authenticity_token
  respond_to :json

  def create
    CreateOrder.new(params).call

    head :created
  end
end
