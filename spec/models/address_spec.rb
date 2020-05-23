require 'rails_helper'

RSpec.describe Address, type: :model do
  it 'should map from dto' do
    params = {
        nameOriginal: "name",
        streetOriginal: "addressObj",
        code: "addressObj.shipping.code",
        town: "addressObj.shipping.town",
        country: "addressObj.shipping.country",
        deliveryPhone: "addressObj.shipping.phone",
        email: "addressObj.shipping.email",
        addressNote: "addressObj.shipping.note"
    }

    address = Address.from_dto(params)

    expect(address.name_original).to eq(params[:nameOriginal])
    expect(address.street_original).to eq(params[:streetOriginal])
    expect(address.code).to eq(params[:code])
    expect(address.town).to eq(params[:town])
    expect(address.country).to eq(params[:country])
    expect(address.delivery_phone).to eq(params[:deliveryPhone])
    expect(address.email).to eq(params[:email])
    expect(address.address_note).to eq(params[:addressNote])
  end

  it "should transform input in string anyway" do
    params = {
        nameOriginal: "name",
        streetOriginal: "addressObj",
        code: 1234,
        town: "addressObj.shipping.town",
        country: "addressObj.shipping.country",
        deliveryPhone: "addressObj.shipping.phone",
        email: "addressObj.shipping.email",
        addressNote: "addressObj.shipping.note"
    }

    address = Address.from_dto(params)

    expect(address.code).to eq("1234")
  end
end
