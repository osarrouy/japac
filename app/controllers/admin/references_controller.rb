class Admin::ReferencesController < ApplicationController

  layout 'admin'
  
  include Geokit::Geocoders
  
  auto_complete_for :city, :full_address
  
  before_filter :authorize

  # GET /projects
  def index
    @references = Reference.find(:all, :include => 'location', :order => "locations.name")
    
    respond_to do |format|
      format.html
    end
  end

  # GET /projects/1
  def show
    @reference = Reference.find(params[:id])
    
    respond_to do |format|
      format.html
    end
  end

  # GET /projects/new
  def new
    @reference = Reference.new
    @reference.build_location

    respond_to do |format|
      format.html
    end
  end

  # POST /references
  def create
    @reference = Reference.new(params[:reference])
    @reference.location = Location.new(params[:location])

    respond_to do |format|
      if @reference.location.save && @reference.save
        format.html { redirect_to edit_admin_reference_url(@reference) }
      else
        format.html { render :action => "new" }
      end
    end
  end

  # GET /projects/1/edit
  def edit
    @reference = Reference.find(params[:id])
    
    respond_to do |format|
      format.html
    end
  end
  
  # GET /projects/1/generic.js
  def generic
    @reference = Reference.find(params[:id])
    
    respond_to do |format|
      format.js { render :partial => "admin/references/informations/generic" }
    end
  end
  
  # GET /projects/1/echnical.js
  def technical
    @reference = Reference.find(params[:id])
    
    respond_to do |format|
       format.js { render :partial => "admin/references/informations/technical" }
    end 
  end
  
  # GET /projects/1/localisation.js
  def localisation
    @reference = Reference.find(params[:id])
    
    respond_to do |format|
      format.js { render :partial => "admin/references/informations/localisation" }
    end
  end

  def photos
    @reference = Reference.find(params[:id])
    
    respond_to do |format|
      format.js { render :partial => 'admin/references/informations/photos' }
    end
  end

  # GET /projects/1/edit_generic.js
  def edit_generic
    @reference = Reference.find(params[:id])
    
    respond_to do |format|
      format.js { render :partial => "admin/references/edition/generic" }
    end
  end
  
  # GET /projects/1/edit_technical.js
  def edit_technical
    @reference = Reference.find(params[:id])
    
    respond_to do |format|
       format.js { render :partial => "admin/references/edition/technical" }
    end
    
  end
  
  # GET /projects/1/edit_localisation.js
  def edit_localisation
    @reference = Reference.find(params[:id])
    
    respond_to do |format|
      format.js { render :partial => "admin/references/edition/localisation", :layout => false }
    end
  end
  
  def update_generic
    @reference = Reference.find(params[:id])
    
    respond_to do |format|
      if @reference.update_attributes(params[:reference])
        format.js { render :partial => '/admin/references/informations/generic' }
      else
        format.js { render :partial => '/admin/references/edition/generic' }
      end
    end
  end
  
  def update_technical
    @reference = Reference.find(params[:id])
    
    respond_to do |format|
      if @reference.update_attributes(params[:reference])
        format.js { render :partial => '/admin/references/informations/technical' }
      else
        format.js { render :partial => '/admin/references/edition/technical' }
      end
    end
  end
  
  def update_localisation
    @reference = Reference.find(params[:id], :include => 'location')
    
    respond_to do |format|
      if @reference.location.update_attributes(params[:location])
        format.js { render :partial => '/admin/references/informations/localisation' }
      else
        format.js { render :partial => '/admin/references/edition/localisation' }
      end
    end
  end

  # DELETE /projects/1
  def destroy
    @reference = Reference.find(params[:id])
    
    @reference.destroy
    flash[:notice] = 'Le projet a été correctement supprimé'
    respond_to do |format|
      format.html { redirect_to admin_references_url }
    end
  end

end
