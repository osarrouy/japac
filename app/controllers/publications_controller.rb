class PublicationsController < ApplicationController

  layout 'public'

  def index
    @publications = Publication.find(:all, :order => "date DESC")
    respond_to do |format|
      format.html
    end
  end

  def show
  end
  

end
