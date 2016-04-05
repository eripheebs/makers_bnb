class MakersBNB < Sinatra::Base
  get '/log-in' do
    erb :'log_in/log_in'
  end

  post '/log-in' do
    redirect to('/spaces')
  end
end
