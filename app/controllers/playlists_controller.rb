class PlaylistsController < ApplicationController
  before_action :set_playlist, only: [:edit, :update, :show]

  def index
  end

  def edit
  end

  def update
    @playlist.songs.destroy_all
    add_songs_to_playlist unless song_ids.nil?
    redirect_to @playlist
  end

  def show
  end

  def new
    @playlist = Playlist.new
  end

  def create
    @playlist = Playlist.new(playlist_params)
    if @playlist.save
      add_songs_to_playlist unless song_ids.nil?
      redirect_to @playlist
    else
      render :new
    end
  end

  private

  def song_ids
    params[:playlist][:song_ids]
  end

  def set_playlist
    @playlist = Playlist.find(params[:id])
  end

  def add_songs_to_playlist
    @playlist.songs << Song.find(song_ids)
  end

  def playlist_params
    params.require(:playlist).permit(:name)
  end
end
