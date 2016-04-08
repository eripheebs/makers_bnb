class MakersBNB < Sinatra::Base

  get '/spaces' do
    @spaces = Space.all
    erb :'spaces/spaces'
  end

  post '/spaces/filtered' do
    filter_start_date = Date.parse(params[:start_date])
    filter_end_date = Date.parse(params[:end_date])
    @filter_dates = (filter_start_date..filter_end_date).to_a
    @spaces = []
    Space.all.each do |space|
      @booked_dates = []
      space.bookings.all.each do |booking|
        booking_array = (booking.start_date..booking.end_date).to_a
        @booked_dates += booking_array
        booking_array = []
      end
      if space.start_date <= filter_start_date && space.end_date >= filter_end_date
        if (@filter_dates & @booked_dates).empty?
          @spaces << space
        end
      end
    end
    erb :'spaces/spaces'
  end

end
