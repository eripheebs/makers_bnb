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
    request = Request.create(start_date: params[:start_date], end_date: params[:end_date])
    space = Space.get(session[:space])
    space.requests << request
    current_user.requests << request
    request.save
    session[:request] = request.id
    redirect to('/request/confirmation')
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

end
