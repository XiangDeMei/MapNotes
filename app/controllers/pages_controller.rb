class PagesController < ApplicationController
  def home
    if signed_in?
      @notes = current_user.notes
      gon.notes=[]
      @notes.each_with_index do |k, index|
        gon.notes[index] = k.attributes
      end
    end
  end

  def help
  end
end
