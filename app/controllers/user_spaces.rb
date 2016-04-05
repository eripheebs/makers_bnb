class MakersBNB < Sinatra::Base

  get '/user_spaces' do

    @spaces = User.get(session[:user_id]).spaces.all
    erb :'spaces/spaces'
  end

end
