class Admin::EventsController < ApplicationController

  layout 'admin'
  
  before_filter :authorize

  def index
    @events = Event.find(:all, :order => "date DESC")

    respond_to do |format|
      format.html
    end
  end

  def generic
    @event = Event.find(params[:id])
    
    respond_to do |format|
      format.js { render :partial => 'admin/events/informations/generic' }
    end
  end
  
  def technical
    @event = Event.find(params[:id])
    
    respond_to do |format|
      format.js { render :partial => 'admin/events/informations/technical' }
    end
  end
  
  def photos
    @event = Event.find(params[:id])
    
    respond_to do |format|
      format.js { render :partial => 'admin/events/informations/photos' }
    end
  end

  def new
    @event = Event.new
    
    respond_to do |format|
      format.html
    end
  end

  def create
    @event = Event.new(params[:event])

    respond_to do |format|
      if @event.save
        format.html { redirect_to edit_admin_event_path(@event) }
      else
        format.html { render :action => 'new' }
      end
    end
  end

  def edit
    @event = Event.find(params[:id])
    
    respond_to do |format|
      format.html
    end
  end

  def edit_generic
    @event = Event.find(params[:id])
    
    respond_to do |format|
      format.js { render :partial => 'admin/events/edition/generic' }
    end
  end
  
  def edit_technical
    @event = Event.find(params[:id])
    
    respond_to do |format|
      format.js { render :partial => 'admin/events/edition/technical' }
    end
  end

  def update_generic
    @event = Event.find(params[:id])

    respond_to do |format|
      if @event.update_attributes(params[:event])
        format.js { render :partial => '/admin/events/informations/generic' }
      else
        format.js { render :partial => '/admin/events/edition/generic' }
      end
    end
  end
  
  def update_technical
    @event = Event.find(params[:id])

    respond_to do |format|
      if @event.update_attributes(params[:event])
        format.js { render :partial => '/admin/events/informations/technical' }
      else
        format.js { render :partial => '/admin/events/edition/technical' }
      end
    end
  end

  def destroy
    @event = Event.find(params[:id])
    
    @event.destroy
    flash[:notice] = 'L\'actualité a été correctement supprimée'
    respond_to do |format|
      format.html { redirect_to admin_events_path }
    end
  end

end
