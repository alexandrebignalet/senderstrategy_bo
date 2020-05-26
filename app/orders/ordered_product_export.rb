# frozen_string_literal: true

require 'csv'

class OrderedProductExport
  def initialize
    @product_headers = %w[product_type product_category number
                          pricing unit subtotal shipping total mode tax].freeze
    @address_headers = %w[name_original street_original code town
                          country delivery_phone email address_note].freeze
    @order_headers = %w[id_distributors payment_method transaction_id transaction_mode
                       transaction_state transaction_percent tva_reference import_url
                       coupon amount god_father shipping_direct is_shipped how_known].freeze
  end

  def generate_csv
    CSV.generate(headers: true) do |csv|
      csv << @product_headers +
             shipping_address_headers +
             @order_headers +
             billing_address_headers

      Product.includes(order: %i[shipping_address billing_address]).all.order(:created_at)
             .each do |product|
        csv << generate_csv_line(product)
      end
    end
  end

  private

  def generate_csv_line(product)
    order = product.order
    line = build_line_from_headers(@product_headers, product) +
           build_line_from_headers(@address_headers, order.shipping_address) +
           build_line_from_headers(@order_headers, order)

    line << build_line_from_headers(@address_headers, order.billing_address) if order.billing_address

    line
  end

  def build_line_from_headers(headers, model)
    headers.map { |attr| model.send(attr) }
  end

  def shipping_address_headers
    append_prefix(@address_headers, 'shipping_')
  end

  def billing_address_headers
    append_prefix(@address_headers, 'billing_')
  end

  def append_prefix(stringArr, prefix)
    stringArr.map { |it| prefix + it }
  end
end
