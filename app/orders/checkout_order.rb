class CheckoutOrder
  def initialize(params)
    @params = params
    @order_id = params[:idOrders]
    @success_url = params[:successUrl]
    @cancel_url = params[:errorUrl]
  end

  def call
    ActiveRecord::Base.transaction do
      session = create_stripe_session

      attach_payment_to_order(session)

      session
    end
  end

  private

  def attach_payment_to_order(session)
    order = Order.find(@order_id)
    order.payment_id = session.payment_intent
    order.save
  end

  def create_stripe_session
    product = Stripe::Product.create({name: @params[:name] })

    price = Stripe::Price.create(
        {
            product: product.id,
            unit_amount: @params[:amount],
            currency: @params[:currency],
        }
    )

    Stripe::Checkout::Session.create(
        payment_method_types: ['card'],
        line_items: [{
                         price: price.id,
                         description: @params[:description],
                         quantity: @params[:quantity]
                     }],
        metadata: {
            order_id: @order_id
        },
        mode: 'payment',
        success_url: @success_url,
        cancel_url: @cancel_url,
        customer_email: @params[:email],
        locale: @params[:locale]

    )
  end
end