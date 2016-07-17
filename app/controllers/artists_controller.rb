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
      flash.notice = "Please enter a longer name"
      render :new
    end
  end

  def show
    @songs = @artist.songs.all
  end

  def edit
  end

  def update
    new_artist = Artist.new(article_params)
    if new_artist.valid?
      @artist.update_attributes(article_params)
      redirect_to artist_path(@artist)
    else
      flash.notice = "Please enter a longer name"
      redirect_to edit_artist_path(@artist)
    end
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
