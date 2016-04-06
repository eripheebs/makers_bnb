class MakersBNB < Sinatra::Base
  post '/booking/create' do
    rekwest = Request.get(params[:accept])
    booking = Booking.new(start_date: rekwest.start_date, end_date: rekwest.end_date)
    current_user.bookings << booking
    Space.get(rekwest.space_id).bookings << booking
    booking.save
    session[:booking]=booking.id
    rekwest.destroy
    redirect to('/bookings')
  end

  get ('/bookings') do
    @bookings = current_user.bookings
    erb :bookings
  end
end
