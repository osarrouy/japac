class ReferencesController < ApplicationController
  
  layout 'public'
  
  def index
    @references = []
    if params[:size]
      if params[:size] == "0"
    		@references = Reference.find(:all, :include => [ :location, :photos ], :order => "locations.name")
    	elsif params[:size] == "1"
    		@references = Reference.find(:all, :conditions => [ "size <= 2500" ], :order => "locations.name")
    	elsif params[:size] == "2"
    		@references = Reference.find(:all, :conditions => [ "size > 2500 and size < 5000" ], :order => "locations.name")
    	elsif params[:size] == "3"
    		@references = Reference.find(:all, :conditions => [ "size >= 5000" ], :order => "locations.name")
    	end
    else
      @references = Reference.find(:all, :include => [ :location, :photos ], :order => "locations.name")
    end
    
    respond_to do |format|
      format.html
      format.js { render :partial => 'names' }
    end
  end
  
  def map
    respond_to do |format|
      format.html
    end
  end
  
  def show
    @reference = Reference.find(params[:id])
    
    respond_to do |format|
      format.html
      format.js { render :layout => false }
    end
  end
  
  def show_informations
    @reference = Reference.find(params[:id])
    
    respond_to do |format|
      format.js  
    end
  end
  
  def get_random_small_photo
    @photo = ProjectPhoto.random
    
    respond_to do |format|
      format.js
    end
  end
  
  def get_random_medium_photo
    @photo = ProjectPhoto.random
    respond_to do |format|
      format.html { render :partial => 'random_medium_photo', :object => @photo, :layout => false }
    end
  end
  
  def size_form
  	@size = params[:size]
  	@projects = []
  	
  	if @size == "1"
  		@projects = Project.find(:all, :conditions => [ "size < 1000" ])
  	elsif @size == "2"
  		@projects = Project.find(:all, :conditions => [ "size > 1000 and size <= 2500" ])
  	elsif @size == "3"
  		@projects = Project.find(:all, :conditions => [ "size > 2500 and size <= 5000" ])
  	elsif @size == "4"
  		@projects = Project.find(:all, :conditions => [ "size > 5000" ])
  		
  	end
  	
  	respond_to do |format|
  		format.html { render :partial => 'size_list', :layout => false }
  	end

  end

end
