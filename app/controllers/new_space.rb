class MakersBNB < Sinatra::Base
  get '/new/space' do
    erb :'spaces/new'
  end

  post '/new/space' do
    space = Space.new(name: params[:name], description: params[:description],
                      price: params[:price], start_date: params[:start_date],
                      end_date: params[:end_date])
    if space.start_date >= space.end_date
      flash.now[:error] = ["End date must be after start date"]
      erb :'spaces/new'
    else
      current_user.spaces << space
      space.save
      redirect to('/spaces')
    end
  end

end
