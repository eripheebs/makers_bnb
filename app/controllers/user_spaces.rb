class MakersBNB < Sinatra::Base

  get '/user_spaces' do
    @spaces = current_user.spaces
    erb :'spaces/my_spaces'
  end

  get '/user_spaces/edit' do
    session[:space] = params[:edit]
    erb :'spaces/edit_space'
  end

  post '/user_spaces/edit' do
    spaces = Space.get(session[:space])
    spaces.name = params[:name]
    spaces.description = params[:description]
    spaces.price = params[:price]
    spaces.save
    @spaces = current_user.spaces
    erb :'spaces/my_spaces'
  end

  post '/user_spaces/delete' do
    rekwest = Request.get(params[:reject])
    rekwest.destroy
    redirect to('/user_spaces')
  end

end
