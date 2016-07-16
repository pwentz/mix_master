class SongsController < ApplicationController
  def index
    @songs = Song.all
  end

  def new
    @song = Song.new
  end

  def show
    @song = Song.find(params["id"])
  end

  def create
    @song = Song.new(song_params)
    if @song.save
      flash.notice = "Song created!"
      redirect_to artist_songs_path(song.article_id)
    else
      flash.notice = "Songs must have a valid title"
      redirect_to new_artist_song_path(song.article_id)
    end
  end

  private

  def song_params
    params.require(:song).permit(:title)
  end
end
