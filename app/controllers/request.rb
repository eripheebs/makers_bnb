class MakersBNB < Sinatra::Base
  post '/request/make' do
    session[:space] = params[:request]
    redirect to('/request/new')
  end

  get '/request/new' do
    @space = Space.get(session[:space])
    erb :'request/new'
  end

  post '/request/new' do
    request = Request.new
    # space = Space.get(...)
    space.requests << request
    current_user.requests << request
    request.save
    redirect to('/request/confirmation')
  end

  get '/request/confirmation' do
    erb :'request/confirmation'
  end

end
