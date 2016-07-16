class ArtistsController < ApplicationController
  def index
    @artists = Artist.all
  end

  def new
    @artist = Artist.new
  end

  def create
    @artist = Artist.new(article_params)
    if @artist.save
      redirect_to artist_path(@artist)
    else
      render :new
    end
  end

  def show
    @artist = Artist.find(params[:id])
    @songs = @artist.songs.all
  end

  def edit
    @artist = Artist.find(params[:id])
  end

  def update
    artist = Artist.find(params[:id])
    artist.update_attributes(article_params)
    redirect_to artist_path(artist)
  end

  def destroy
    Artist.find(params[:id]).destroy
    redirect_to artists_path
  end

  private

  def article_params
    params.require(:artist).permit(:name, :image_path)
  end
end
