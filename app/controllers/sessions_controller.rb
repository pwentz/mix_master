class SessionsController < ApplicationController

  def create
    @user = User.find_or_create_from_auth(request.env['omniauth.auth'])
    if @user 
      session[:user_id] = @user.id
      redirect_to playlists_path
    end
  end

  def destroy
    session.clear
    redirect_to playlists_path
  end

  private

  def find_playlists
  end
end
