class MakersBNB

  get '/payment' do
    @booking = Booking.get(params[:payment])
    erb :'payment/payment'
  end

  post '/payment' do
    @amount = 500

    customer = Stripe::Customer.create(
      :email => 'customer@example.com',
      :card  => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :amount      => @amount,
      :description => 'Sinatra Charge',
      :currency    => 'usd',
      :customer    => customer.id
    )

    erb :charge
  end

end
