class PlaylistsController < ApplicationController
  def index
  end

  def show
    @playlist = Playlist.find(params[:id])
  end

  def new
    @playlist = Playlist.new
  end

  def create
    @playlist = Playlist.create(playlist_params)
    add_songs(@playlist)
    redirect_to playlist_path(@playlist)
  end

  private

  def playlist_params
    params.require(:playlist).permit(:name)
  end

  def add_songs(playlist)
    new_playlist_songs = params["playlist"]["song_ids"]
    unless new_playlist_songs.empty?
      new_playlist_songs.each do |song_id|
        playlist.songs << Song.find(song_id)
      end
    end
  end
end
