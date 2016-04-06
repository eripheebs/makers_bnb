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
    @space = Space.get(session[:space])
    request = Request.new(start_date: params[:start_date], end_date: params[:end_date])
    if request.start_date > @space.start_date && request.end_date < @space.end_date
      @space.requests << request
      current_user.requests << request
      request.save
      session[:request] = request.id
      redirect to('/request/confirmation')
    else
      flash.now[:error] = ["#{@space.name} is not available for those dates!"]
      erb :'request/new'
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
