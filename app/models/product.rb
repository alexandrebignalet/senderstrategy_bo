class Product < ApplicationRecord
  belongs_to :order

  def self.from_dto(params)
    Product.new(product_type: params[:productType],
                product_category: params[:productCategory],
                number: params[:number],
                pricing: params[:pricing],
                unit: params[:unit],
                subtotal: params[:subtotal],
                shipping: params[:shipping],
                total: params[:total],
                mode: params[:mode],
                tax: params[:tax])
  end
end
