class MakersBNB < Sinatra::Base

  get '/user_spaces' do
    @spaces = @current_user.spaces.all
    erb :'spaces/spaces'
  end

end
