class MakersBNB < Sinatra::Base
  get '/new/space' do
    erb :'spaces/new'
  end

  post '/new/space' do
    #@current_user = User.get(session[:user_id])
    space = Space.create(name: params[:name], description: params[:description], price: params[:price], user: User.get(session[:user_id]))
    redirect ('/user_spaces')
  end

end
