# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Order, type: :model do
  params = {
    idDistributors: 'idDistributors',
    paymentMethod: 'paymentMethod',
    transactionId: 'transactionId',
    transactionMode: 'transactionMode',
    transactionState: 'transactionState',
    transactionPercent: 'transactionPercent',
    tvaReference: 'tvaReference',
    importUrl: 'importUrl',
    coupon: 'coupon',
    amount: 'amount',
    godFather: 'godFather',
    shippingDirect: true,
    isShipped: false,
    howKnown: 'howKnown'
  }

  it 'should map from dto' do
    order = Order.from_dto(params)

    expect(order.id_distributors).to eq(params[:idDistributors])
    expect(order.payment_method).to eq(params[:paymentMethod])
    expect(order.transaction_id).to eq(params[:transactionId])
    expect(order.transaction_mode).to eq(params[:transactionMode])
    expect(order.transaction_state).to eq(params[:transactionState])
    expect(order.transaction_percent).to eq(params[:transactionPercent])
    expect(order.tva_reference).to eq(params[:tvaReference])
    expect(order.import_url).to eq(params[:importUrl])
    expect(order.coupon).to eq(params[:coupon])
    expect(order.amount).to eq(params[:amount])
    expect(order.god_father).to eq(params[:godFather])
    expect(order.shipping_direct).to eq(params[:shippingDirect])
    expect(order.is_shipped).to eq(params[:isShipped])
    expect(order.how_known).to eq(params[:howKnown])
  end

  it 'should transform input in string anyway' do
    params = params.merge(transactionId: 1234)
    order = Order.from_dto(params)

    expect(order.transaction_id).to eq('1234')
  end
end
