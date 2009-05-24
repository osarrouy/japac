class PhotosController < ApplicationController
  
  def show
    @photo = Photo.find(params[:id])
    
    respond_to do |format|
      format.js
    end
  end
  
  def event_medium
    @photo = Photo.random(:event)
    
    respond_to do |format|
      format.js { render :partial => 'event_medium' }
    end
  end
  
  def reference_medium
    @photo = Photo.random(:reference)
    
    respond_to do |format|
      format.js { render :partial => 'reference_medium' }
    end
  end

end
