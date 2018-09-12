class AlbumsController < ApplicationController
  def show
    @album = Album.find(params[:id])
    render :show
  end

  def new
    @album = Album.new
    @bands = Bands.all
  end

  def create
    @album = Album.new(album_params)
    if @album.save
      redirect_to album_url(@album.id)
    else
      flash.now[:errors] = @album.errors.full_messages
      redirect_to new_band_album_url(@album.id)
    end
  end

  def edit
    @album = Album.find(params[:id])
    render :edit
  end

  def update
    @album = Album.find(params[:id])
    if @album.update_attributes(album_params)
      redirect_to album_url(@album.id)
    else
      flash.now[:errors] = @album.errors.full_messages
    end
  end

  def destroy

  end

  private
  def album_params
    params.require(:album).permit(:title, :year, :studio)
  end
end
