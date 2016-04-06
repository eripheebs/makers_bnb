class MakersBNB < Sinatra::Base
  get '/log-in' do
    erb :'log_in/log_in'
  end

  post '/log-in' do
    user = User.first(email: params[:email])
    if user.nil?
      flash.now[:error] = ["User does not exist!"]
      erb :'log_in/log_in'
    elsif user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect to('/spaces')
    else
      flash.now[:error] = ["Wrong Password"]
      erb :'log_in/log_in'
    end
  end

  post '/log-out' do
    session[:user_id] = nil
    redirect to('/')
  end
end
