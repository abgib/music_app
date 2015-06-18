class AlbumsController < ApplicationController
  def new
    if !params[:album].nil?
      @album = Album.new(band_id: params[:album][:band_id])
    else
      @album = Album.new
    end

    render :new
  end

  def create
    @album = Album.new(album_params)

    if @album.save
      redirect_to album_url(@album)
    else
      flash.now[:errors] = @album.errors.full_messages
      render :new
    end
  end

  def show
    @album = Album.find(params[:id])
    render :show
  end

  def edit
    @album = Album.find(params[:id])
    render :edit
  end

  def update
    @album = Album.find(params[:id])

    if @album.update(album_params)
      redirect_to album_url(@album)
    else
      flash.now[:errors] = @album.errors.full_messages
      render :edit
    end
  end

  def destroy
    @album = Album.find(params[:id])

    if @album.destroy
      flash[:errors] = ["Album deleted"]
      redirect_to user_url(current_user.id)
    else
      flash.now[:errors] = ["No album exists"]
      redirect_to user_url(current_user.id)
    end
  end

  private
  def album_params
    params.require(:album).permit(:band_id, :style_type,
      :title,)
  end

end
