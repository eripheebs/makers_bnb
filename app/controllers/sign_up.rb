class MakersBNB < Sinatra::Base
  get '/sign-up' do
    erb :'sign_up/sign_up'
  end

  post '/sign-up' do
    @user = User.new(username: params[:username], email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      redirect to('/spaces')
    else
      flash.now[:error] = @user.errors.full_messages
      erb :'sign_up/sign_up'
    end
  end
end
