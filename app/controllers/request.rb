class MakersBNB < Sinatra::Base
  post '/request/make' do
  space = Space.get(params[:request])
    if current_user.spaces.include? space
      flash.now[:error] = ["You cannot request your own space!"]
      @spaces = Space.all
      erb :'spaces/spaces'
    else
      session[:space] = params[:request]
      redirect to('/request/new')
    end
  end

  get '/request/new' do
    @space = Space.get(session[:space])
    erb :'request/new'
  end

  post '/request/new' do
    @space = Space.get(session[:space])
    request = Request.new(start_date: params[:start_date], end_date: params[:end_date])
    if request.start_date >= request.end_date
      flash.now[:error] = ["End date must be after start date"]
      erb :'request/new'
    else
      @booked_dates = []
      @request_dates = (request.start_date..request.end_date).to_a
      @space.bookings.all.each do |booking|
        booking_array = (booking.start_date..booking.end_date).to_a
        @booked_dates += booking_array
        booking_array = []
      end
      if (@request_dates & @booked_dates).empty?
        @space.requests << request
        current_user.requests << request
        request.save
        session[:request] = request.id
        Email.new.send_mail(User.get(@space.user_id).email, 'Someone has requested your space!', erb(:'emails/requestee_email', layout: false))
        Email.new.send_mail(current_user.email, 'You have requested a space!', erb(:'emails/requester_email', layout: false))
        redirect to('/request/confirmation')
      else
        flash.now[:error] = ["That space is already booked for that date!"]
        @spaces = Space.all
        erb :'spaces/spaces'
      end
    end
  end

  get '/request/confirmation' do
    @space = Space.get(session[:space])
    @rekwest = Request.get(session[:request])
    erb :'request/confirmation'
  end

  get '/requests_made' do
    @rekwests = current_user.requests
    erb :'request/view'
  end

  post '/request/delete' do
    rekwest = Request.get(params[:cancel_request])
    rekwest.destroy
    redirect to('/requests_made')
  end

end
