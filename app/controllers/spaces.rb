class MakersBNB < Sinatra::Base

  get '/spaces' do
    @spaces = Space.all
    erb :'spaces/spaces'
  end

end
