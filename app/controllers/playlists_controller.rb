class PlaylistsController < ApplicationController
  def index
  end

  def edit
    @playlist = Playlist.find(params[:id])
  end

  def update
    @playlist = Playlist.find(params[:id])
    @playlist.songs.destroy_all
    @playlist.songs << Song.find(params[:playlist][:song_ids])
    redirect_to @playlist
  end

  def show
    @playlist = Playlist.find(params[:id])
  end

  def new
    @playlist = Playlist.new
  end

  def create
    @playlist = Playlist.create(playlist_params)
    @playlist.songs << Song.find(params[:playlist][:song_ids])
    redirect_to @playlist
  end

  private

  def playlist_params
    params.require(:playlist).permit(:name)
  end
end
