class SongsController < ApplicationController

  def new
    @artist = Artist.find(params[:artist_id])
    @song = @artist.songs.new
  end

  def show
    @song = Song.find(params["id"])
  end

  def create
    @artist = Artist.find(params[:artist_id])
    @song = @artist.songs.create(song_params)
    if @song.save
      flash.notice = "Song created!"
      redirect_to artist_path(@artist.id)
    else
      flash.notice = "Songs must have a valid title"
      redirect_to new_artist_song_path(@song.artist_id)
    end
  end

  private

  def song_params
    params.require(:song).permit(:title)
  end
end
