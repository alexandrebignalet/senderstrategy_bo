require 'rails_helper'

RSpec.describe OrdersController, type: :request do

  it 'should create a complete order' do
    create_orders_resource_path = '/orders'

    input = complete_order_json

    post create_orders_resource_path, params: input

    expect(response).to be_successful
    expect(response.status).to be(201)

    created_order = Order.last
    shipping_address = created_order.shipping_address
    billing_address = created_order.billing_address
    order_products = created_order.products

    # response
    expect(response.body).to eq([{ idOrders: created_order.id }].to_json)

    # order
    expect(created_order.id_distributors).to eq(input[:idDistributors])
    expect(created_order.payment_method).to eq(input[:paymentMethod])
    expect(created_order.transaction_id).to eq(input[:transactionId])
    expect(created_order.transaction_mode).to eq(input[:transactionMode])
    expect(created_order.transaction_state).to eq(input[:transactionState])
    expect(created_order.transaction_percent).to eq(input[:transactionPercent])
    expect(created_order.tva_reference).to eq(input[:tvaReference])
    expect(created_order.import_url).to eq(input[:importUrl])
    expect(created_order.coupon).to eq(input[:coupon])
    expect(created_order.amount).to eq(input[:amount])
    expect(created_order.god_father).to eq(input[:godFather])
    expect(created_order.shipping_direct).to eq(input[:shippingDirect])
    expect(created_order.is_shipped).to eq(input[:isShipped])
    expect(created_order.how_known).to eq(input[:howKnown])
    # addresses
    expect(shipping_address.name_original).to eq(input[:shipping][:nameOriginal])
    expect(shipping_address.street_original).to eq(input[:shipping][:streetOriginal])
    expect(shipping_address.code).to eq(input[:shipping][:code])
    expect(shipping_address.town).to eq(input[:shipping][:town])
    expect(shipping_address.country).to eq(input[:shipping][:country])
    expect(shipping_address.delivery_phone).to eq(input[:shipping][:deliveryPhone])
    expect(shipping_address.email).to eq(input[:shipping][:email])
    expect(shipping_address.address_note).to eq(input[:shipping][:addressNote])

    expect(billing_address.name_original).to eq(input[:billing][:nameOriginal])
    expect(billing_address.street_original).to eq(input[:billing][:streetOriginal])
    expect(billing_address.code).to eq(input[:billing][:code])
    expect(billing_address.town).to eq(input[:billing][:town])
    expect(billing_address.country).to eq(input[:billing][:country])
    expect(billing_address.delivery_phone).to eq(input[:billing][:deliveryPhone])
    expect(billing_address.email).to eq(input[:billing][:email])
    expect(billing_address.address_note).to eq(input[:billing][:addressNote])

    expect(order_products[1].product_type).to eq(input[:productTab][0][:productType])
    expect(order_products[1].product_category).to eq(input[:productTab][0][:productCategory])
    expect(order_products[1].number).to eq(input[:productTab][0][:number].to_s)
    expect(order_products[1].pricing).to eq(input[:productTab][0][:pricing])
    expect(order_products[1].unit).to eq(input[:productTab][0][:unit].to_s)
    expect(order_products[1].subtotal).to eq(input[:productTab][0][:subtotal])
    expect(order_products[1].shipping).to eq(input[:productTab][0][:shipping].to_s)
    expect(order_products[1].total).to eq(input[:productTab][0][:total])
    expect(order_products[1].mode).to eq(input[:productTab][0][:mode])
    expect(order_products[1].tax).to eq(input[:productTab][0][:tax])

    expect(order_products[0].product_type).to eq(input[:productTab][1][:productType])
    expect(order_products[0].product_category).to eq(input[:productTab][1][:productCategory])
    expect(order_products[0].number).to eq(input[:productTab][1][:number].to_s)
    expect(order_products[0].pricing).to eq(input[:productTab][1][:pricing])
    expect(order_products[0].unit).to eq(input[:productTab][1][:unit].to_s)
    expect(order_products[0].subtotal).to eq(input[:productTab][1][:subtotal])
    expect(order_products[0].shipping).to eq(input[:productTab][1][:shipping].to_s)
    expect(order_products[0].total).to eq(input[:productTab][1][:total])
    expect(order_products[0].mode).to eq(input[:productTab][1][:mode])
    expect(order_products[0].tax).to eq(input[:productTab][1][:tax])
  end

  it 'should create an order without billing address' do
    create_orders_resource_path = '/orders'

    input = complete_order_json

    post create_orders_resource_path, params: input.merge(billing: nil)

    expect(response).to be_successful
    expect(response.status).to be(201)

    expect(Order.last.billing_address).to be_nil
  end

  private

  def complete_order_json
    {
        "idDistributors": 'idDistributors',
        "paymentMethod": 'paymentMethod',
        "transactionId": 'transactionId',
        "transactionMode": 'transactionMode',
        "transactionState": 'transactionState',
        "transactionPercent": 'transactionPercent',
        "tvaReference": 'tvaReference',
        "importUrl": 'importUrl',
        "coupon": 'coupon',
        "amount": 'amount',
        "godFather": 'godFather',
        "shippingDirect": true,
        "isShipped": false,
        "howKnown": 'howKnown',
        "shipping": {
            "nameOriginal": 'name',
            "streetOriginal": 'addressObj',
            "code": 'addressObj.shipping.code',
            "town": 'addressObj.shipping.town',
            "country": 'addressObj.shipping.country',
            "deliveryPhone": 'addressObj.shipping.phone',
            "email": 'addressObj.shipping.email',
            "addressNote": 'addressObj.shipping.note'
        },
        "billing": {
            "nameOriginal": 'billing_name',
            "streetOriginal": 'billing_addressObj',
            "code": 'billing_addressObj.shipping.code',
            "town": 'billing_addressObj.shipping.town',
            "country": 'billing_addressObj.shipping.country',
            "deliveryPhone": 'abilling_ddressObj.shipping.phone',
            "email": 'abilling_ddressObj.shipping.email',
            "addressNote": 'addresbilling_sObj.shipping.note'
        },
        "productTab": [{
                         "productType": '1_productType',
                         "productCategory": '1_productCategory',
                         "number": 12343,
                         "pricing": '&1_é',
                         "unit": 12,
                         "subtotal": 'sub1_total',
                         "shipping": 123.23,
                         "total": 'tot1_al',
                         "mode": 'mod1_e',
                         "tax": 't1_ax'
                     }, {
                         "productType": 'productType',
                         "productCategory": 'productCategory',
                         "number": 1234,
                         "pricing": '&é',
                         "unit": 12,
                         "subtotal": 'subtotal',
                         "shipping": 123.23,
                         "total": 'total',
                         "mode": 'mode',
                         "tax": 'tax'
                     }]
    }
  end
end
