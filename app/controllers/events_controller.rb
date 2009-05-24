class EventsController < ApplicationController
  
  layout 'public'
  
  def index
    @inaugurations = Event.find_all_by_kind('inauguration', :include => :photos , :order => "date DESC")
    @won_contests = Event.find_all_by_kind('won_contest', :include => :photos, :order => "date DESC")
    
    respond_to do |format|
      format.html
    end
  end

  def show
    @event = Event.find(params[:id])
    
    respond_to do |format|
      format.html
      format.js { render :layout => false }
    end
  end

  def show_informations
    @event = Event.find(params[:id])
    
    respond_to do |format|
      format.js
    end
  end

  def get_random_small_photo
    @photo = EventPhoto.random
    
    respond_to do |format|
      format.js
    end
  end

  def get_random_medium_photo
    @photo = EventPhoto.random
    
    respond_to do |format|
      format.html { render :partial => 'random_medium_photo', :object => @photo, :layout => false }
    end
  end

end
