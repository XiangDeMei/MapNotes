class PagesController < ApplicationController
  def home
    if signed_in?
      @notes = current_user.notes
      gon.notes=[]
      @notes.each_with_index do |k, index|
        gon.notes[index] = k.attributes
      end
    end

    respond_to do |format|
      format.html
      format.js
    end
  end

  def help
  end
end
