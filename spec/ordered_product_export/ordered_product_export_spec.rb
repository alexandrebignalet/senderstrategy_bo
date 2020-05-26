# frozen_string_literal: true

require 'rails_helper'

RSpec.describe OrderedProductExport do
  before do
    CreateOrder.new(complete_order).call
    @order = Order.last
    @csv = OrderedProductExport.new.generate_csv
  end

  it 'should have the rights headers' do
    expected = %w[
      product_type
      product_category
      number
      pricing
      unit
      subtotal
      shipping
      total
      mode
      tax
      shipping_name_original
      shipping_street_original
      shipping_code
      shipping_town
      shipping_country
      shipping_delivery_phone
      shipping_email
      shipping_address_note
      id_distributors
      payment_method
      transaction_id
      transaction_mode
      transaction_state
      transaction_percent
      tva_reference
      import_url
      coupon
      amount
      god_father
      shipping_direct
      is_shipped
      how_known
      billing_name_original
      billing_street_original
      billing_code
      billing_town
      billing_country
      billing_delivery_phone
      billing_email
      billing_address_note
    ]
    headers = @csv.split("\n")[0]
    headers_arr = headers.split(',')
    expect(headers_arr).to eq(expected)
  end

  it 'should have as many lines (without headers) as products in the order' do
    csv_arr = @csv.split("\n")
    expect(csv_arr.size - 1).to eq(@order.products.size)
  end

  it 'should not fill cells for billing address if not present' do
    @order.billing_address = nil
    @order.save!

    csv = OrderedProductExport.new.generate_csv

    lines = csv.split("\n")
    last_cell = lines[1].split(',').last
    expect(last_cell).to eq('howKnown') # last cell value before first billing cell
  end

  private

  def complete_order
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
        "number": 12_343,
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
