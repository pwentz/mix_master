class ArtistsController < ApplicationController
  before_action :set_artist, only: [:update, :edit, :show, :destroy]
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
    @songs = @artist.songs.all
  end

  def edit
  end

  def update
    @artist.update_attributes(article_params)
    redirect_to artist_path(@artist)
  end

  def destroy
    @artist.destroy
    redirect_to artists_path
  end

  private

  def set_artist
    @artist = Artist.find(params[:id])
  end

  def article_params
    params.require(:artist).permit(:name, :image_path)
  end
end
