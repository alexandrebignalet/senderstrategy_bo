class CheckoutOrder
  def initialize(params)
    @params = params
    @success_url = params[:successUrl]
    @cancel_url = params[:errorUrl]
  end

  def call
    product = Stripe::Product.create({name: @params[:name] })

    price = Stripe::Price.create(
        {
            product: product.id,
            unit_amount: @params[:amount],
            currency: @params[:currency],
        }
    )

    session = Stripe::Checkout::Session.create(
        payment_method_types: ['card'],
        line_items: [{
             price: price.id,
             description: @params[:description],
             quantity: @params[:quantity]
         }],
        mode: 'payment',
        success_url: @success_url,
        cancel_url: @cancel_url,
        customer_email: @params[:email],
        locale: @params[:locale]

    )
  end
end