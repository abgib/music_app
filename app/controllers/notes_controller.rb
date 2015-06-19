class NotesController < ApplicationController

  def new
    @note = Note.new
    render :new
  end

  def create
    @note = Note.new(note_params)
    @note.user_id = current_user.id

    if @note.save
      redirect_to track_url(Track.find(@note.track_id))
    else
      flash.now[:errors] = @note.errors.full_messages
      render :new
    end
  end

  def show
    @note = Note.find(params[:id])
    render :show
  end

  def edit
    @note = Note.find(params[:id])
    render :edit
  end

  def update
    @note = Note.find(params[:id])

    if @note.update(note_params)
      redirect_to note_url(@note)
    else
      flash.now[:errors] = @note.errors.full_messages
      render :edit
    end
  end

  def destroy
    @note = Note.find(params[:id])

    if @note.destroy
      flash[:errors] = ["Note deleted"]
      redirect_to track_url(Track.find(@note.track_id))
    else
      flash.now[:errors] = ["No note exists"]
      redirect_to track_url(Track.find(@note.track_id))
    end
  end

  private
  def note_params
    params.require(:notes).permit(:track_notes, :track_id)
  end

end
