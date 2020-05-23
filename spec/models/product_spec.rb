require 'rails_helper'

RSpec.describe Product, type: :model do
  it 'should map from dto' do
    params = {
        productType: 'productType',
        productCategory: 'productCategory',
        number: 'number',
        pricing: 'pricing',
        unit: 'unit',
        subtotal: 'subtotal',
        shipping: 'shipping',
        total: 'total',
        mode: 'mode',
        tax: 'tax'
    }

    product = Product.from_dto(params)

    expect(product.product_type).to eq(params[:productType])
    expect(product.product_category).to eq(params[:productCategory])
    expect(product.number).to eq(params[:number])
    expect(product.pricing).to eq(params[:pricing])
    expect(product.unit).to eq(params[:unit])
    expect(product.subtotal).to eq(params[:subtotal])
    expect(product.shipping).to eq(params[:shipping])
    expect(product.total).to eq(params[:total])
    expect(product.mode).to eq(params[:mode])
    expect(product.tax).to eq(params[:tax])
  end

  it 'should cast numbers to string' do
    params = {
        productType: 'productType',
        productCategory: 'productCategory',
        number: 1234,
        pricing: '&é',
        unit: 12,
        subtotal: 'subtotal',
        shipping: 123.23,
        total: 'total',
        mode: 'mode',
        tax: 'tax'
    }

    product = Product.from_dto(params)

    expect(product.number).to eq("1234")
    expect(product.unit).to eq("12")
    expect(product.shipping).to eq("123.23")
  end
end
