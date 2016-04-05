class MakersBNB < Sinatra::Base

  get '/user_spaces' do
    # p User.spaces
    @spaces = User.spaces.all
    erb :'spaces/spaces'
  end

end
