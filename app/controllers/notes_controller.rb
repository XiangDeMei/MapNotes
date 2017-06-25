class NotesController < ApplicationController

  def show
    @note = Note.find(params[:id])
    gon.note = @note.attributes
  end

  def new
    @note = Note.new
  end

  def edit
    @note = Note.find(params[:id])
    gon.note = @note.attributes
  end

  def index
    @notes = Note.all
    gon.notes=[]
    @notes.each_with_index do |k, index|
      gon.notes[index] = k.attributes
    end
  end

  def create
    @note = current_user.notes.build(note_params)
    if @note.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def update
    @note = Note.find(params[:id])
    if @note.update_attributes(note_params)
      flash[:success]="Note updated!"
      redirect_to root_path
    else
      render 'edit'
    end
  end

  def destroy
    @note = Note.find(params[:id])
    @note.destroy
    redirect_to root_path
  end

  private
    def note_params
      params.require(:note).permit(:content, :user_id, :longitude, :latitude)
    end

    def correct_user
      @note = Note.find(params[:id])
      redirect_to(root_path) unless current_user?(@note.user)
    end
end