class PagesController < ApplicationController
  def home
    if signed_in?
      @notes = current_user.notes
    end

    respond_to do |format|
      format.html
      format.js
    end
  end

  def help
  end
end
