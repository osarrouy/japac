class Admin::LocationsController < ApplicationController
  
  layout 'admin'
  
  include Geokit::Geocoders
  
  auto_complete_for :city, :full_address

  before_filter :authorize

  def index
    @cities = City.find(:all, :order => "name")
  end

  def test
    
  end
  
  def geocode
    @location = MultiGeocoder.geocode(params[:location][:full_address])

    render :inline => "<ul><li><%= @location.full_address unless @location.nil? %></li></ul>" 
  end

  def test_result


    @location = MultiGeocoder.geocode(params[:cities][:full_address])
    @city = City.new
    @city.name = @location.full_address
    @city.department = 00
    @city.save

    
    
  end


  def new
    @city = City.new

    respond_to do |format|
      format.js
    end
  end

  def create
    @city = City.new(params[:city])

    respond_to do |format|
      if @city.save
        format.js
      else
        format.js { render :action => 'new' }
      end
    end
  end

  def edit
  	@city = City.find(params[:id])
  	
  	respond_to do |format|
  		format.js
  	end
  end
  
  def update
    @city = City.find(params[:id])
    
    respond_to do |format|
      if @city.update_attributes(params[:city])
      	 @cities = City.find(:all, :order => "name")
        format.js { render :action => 'index' }
      else
        format.js { render :action => 'edit' } 
	  end
	end
  end

  def destroy
    @city = City.find(params[:id])
    
    @city.destroy
    respond_to do |format|
      @cities = City.find(:all)
      format.js { render :action => "index" }
    end
    
  end

end
