class SongsController < ApplicationController
  def index
    @songs = Song.all
  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.new(song_params)
    if @song.save
      flash.notice = "Song created!"
      redirect_to songs_path
    else
      flash.notice = "Songs must have a valid title"
      redirect_to new_song_path
    end
  end

  private

  def song_params
    params.require(:song).permit(:title)
  end
end
