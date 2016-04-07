class MakersBNB < Sinatra::Base
  post '/booking/create' do
    rekwest = Request.get(params[:accept])
    @booking = Booking.new(start_date: rekwest.start_date, end_date: rekwest.end_date)
    User.get(rekwest.user_id).bookings << @booking
    Space.get(rekwest.space_id).bookings << @booking
    @booking.save
    rekwest.destroy
    Email.new.send_mail(current_user.email, 'Your space has been booked!', erb(:'emails/bookee_email', layout: false))
    Email.new.send_mail(User.get(@booking.user_id).email, 'Your booking has been made!', erb(:'emails/booker_email', layout: false))
    redirect to('/bookings')
  end

  get ('/bookings') do
    @bookings = current_user.spaces.bookings
    erb :bookings
  end
end
