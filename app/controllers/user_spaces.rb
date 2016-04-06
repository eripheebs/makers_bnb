class MakersBNB < Sinatra::Base

  get '/user_spaces' do
    @spaces = current_user.spaces
    erb :'spaces/my_spaces'
  end

end
