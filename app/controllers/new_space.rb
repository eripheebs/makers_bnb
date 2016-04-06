class MakersBNB < Sinatra::Base
  get '/new/space' do
    erb :'spaces/new'
  end

  post '/new/space' do
    space = Space.new(name: params[:name], description: params[:description], price: params[:price])
    current_user.spaces << space
    space.save
    redirect to('/spaces')
  end

end
