class CreateOrderResponse
  attr_reader :contentTab

  def self.from(order)
    CreateOrderResponse.new([{ idOrders: order.id }])
  end

  def initialize(content_tab)
    @contentTab = content_tab
  end
end