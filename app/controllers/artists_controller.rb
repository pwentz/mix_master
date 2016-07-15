class ArtistsController < ApplicationController
  def index
    @artists = Artist.all
  end

  def new

  end

  def create
    artist = Artist.new(article_params)
    if artist.save
      redirect_to artist_path(artist.id)
    else
      render :new
    end
  end

  def show
    @artist = Artist.find(params[:id])
  end

  private

  def article_params
    params.require(:artist).permit(:name, :image_path)
  end
end
