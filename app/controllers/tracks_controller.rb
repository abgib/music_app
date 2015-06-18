class TracksController < ApplicationController
  def new
    if !params[:track].nil?
      @track = Track.new(album_id: params[:track][:album_id])
    else
      @track = Track.new
    end

    render :new
  end

  def create
    @track = Track.new(track_params)

    if @track.save
      redirect_to track_url(@track)
    else
      flash.now[:errors] = @track.errors.full_messages
      render :new
    end
  end

  def show
    @track = Track.find(params[:id])
    render :show
  end

  def edit
    @track = Track.find(params[:id])
    render :edit
  end

  def update
    @track = Track.find(params[:id])

    if @track.update(track_params)
      redirect_to track_url(@track)
    else
      flash.now[:errors] = @track.errors.full_messages
      render :edit
    end
  end

  def destroy
    @track = Track.find(params[:id])

    if @track.destroy
      flash[:errors] = ["Track deleted"]
      redirect_to album_url(@track.album_id)
    else
      flash.now[:errors] = ["No Track exists"]
      redirect_to album_url(@track.album_id)
    end
  end

  private
  def track_params
    params.require(:track).permit(:album_id, :song_type,
      :lyrics, :track_title)
  end

end
