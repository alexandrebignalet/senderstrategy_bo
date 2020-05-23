class Address < ApplicationRecord
  has_one :order

  def self.from_dto(params)
    return nil if params.nil?

    Address.new(name_original: params[:nameOriginal],
                street_original: params[:streetOriginal],
                code: params[:code],
                town: params[:town],
                country: params[:country],
                delivery_phone: params[:deliveryPhone],
                email: params[:email],
                address_note: params[:addressNote])
  end
end
