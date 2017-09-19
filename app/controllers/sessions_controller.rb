class SessionsController < ApplicationController

#get '/signin', to: 'sessions#new'
  def new
    @user = User.new
  end

#post '/signin', to: 'sessions#create'
def create
  @user = User.find_by(name: params[:user][:name])
  if @user.authenticate(params[:user][:password])
    session[:user_id] = @user.id
    redirect_to "/users/#{@user.id}"
  else
    flash[:message] = "Username and password do not match"
    render '/sessions/new'
  end
end

#delete '/sign_out' to: 'sessions#destroy'

  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end

end
