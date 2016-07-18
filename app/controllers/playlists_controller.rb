class PlaylistsController < ApplicationController
  before_action :set_playlist, only: [:edit, :update, :show]
  before_action :current_user?, only: [:update, :create, :index]

  def index
  end

  def edit
  end

  def update
    updated_playlist = Playlist.new(playlist_params)
    if updated_playlist.valid?
      @playlist.update_attributes(updated_playlist)
      @playlist.update_songs(@user, song_ids)
      flash.notice = "Playlist updated!"
      redirect_to @playlist
    else
      flash.notice = "Please enter a name for your playlist"
      render :edit
    end
  end

  def show
  end

  def new
    @playlist = Playlist.new
  end

  def create
    @playlist = Playlist.new(playlist_params)
    if @playlist.save
      @playlist.update_songs(@user, song_ids)
      flash.notice = "Playlist created!"
      redirect_to @playlist
    else
      flash.notice = "Please enter a valid name"
      render :new
    end
  end

  private

  def current_user?
    if current_user.nil?
      @user = User.new
    else
      @user = current_user
    end
  end

  def song_ids
    params[:playlist][:song_ids]
  end

  def set_playlist
    @playlist = Playlist.find(params[:id])
  end

  def playlist_params
    params.require(:playlist).permit(:name, :song_ids)
  end
end
