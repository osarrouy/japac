class Admin::PublicationsController < ApplicationController
  
  layout 'admin'
  
  before_filter :authorize
  
  def index
    @publications = Publication.find(:all, :order => 'date DESC')
    
    respond_to do |format|
      format.html
    end
  end

  def new
    @publication = Publication.new
    
    respond_to do |format|
      format.html
    end
  end
  
  def create
    @publication = Publication.new(params[:publication])

    respond_to do |format|
      if @publication.save
        flash[:notice] = 'La publication a été correctement enregistrée'
        format.html { redirect_to admin_publications_path }
      else
        format.html { render :action => "new" }
      end
    end
  end

  def edit
    @publication = Publication.find(params[:id])
    
    respond_to do |format|
      format.html
    end
  end
  
  def update
    @publication = Publication.find(params[:id])
    
    respond_to do |format|
      if @publication.update_attributes(params[:publication])
        flash[:notice] = 'La publication a été correctement modifiée'
        format.html { redirect_to admin_publications_path }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  def destroy
    @publication = Publication.find(params[:id])
    
    @publication.destroy
    flash[:notice] = 'La publication a été correctement supprimée'
    respond_to do |format|
      format.html { redirect_to admin_publications_url }
    end
  end

end
