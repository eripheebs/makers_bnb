class MakersBNB < Sinatra::Base
  get '/' do
    @skip_menu = true
    erb :index
  end
end
