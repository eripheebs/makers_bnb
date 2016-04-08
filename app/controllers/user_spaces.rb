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
    space = Space.get(session[:space])
    space.name = params[:name]
    space.description = params[:description]
    space.price = params[:price]
    space.start_date = params[:start_date]
    space.end_date = params[:end_date]
    if space.start_date >= space.end_date
      flash.now[:error] = ["End date must be after start date"]
      erb :'spaces/edit_space'
    else
      space.save
      @spaces = current_user.spaces
      erb :'spaces/my_spaces'
    end
  end

  post '/user_spaces/delete' do
    rekwest = Request.get(params[:reject])
    rekwest.destroy
    redirect to('/user_spaces')
  end
end
