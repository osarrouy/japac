class Admin::PhotosController < ApplicationController

  layout 'admin'
  
  before_filter :authorize

  def new
    @attachable = find_attachable
    @photo = Photo.new
    
    respond_to do |format|
      format.js { render :partial => 'new' }
    end
  end

  def create
    @attachable = find_attachable
    @photo = @attachable.photos.build(params[:photo])

    respond_to do |format|
      if @photo.save
        format.html do
          responds_to_parent do
            render :update do |page|
              if(@attachable.instance_of? Event)
                @event = @attachable
                page.replace_html 'photos', :partial =>  '/admin/events/informations/photos'
              elsif(@attachable.instance_of? Reference)
                @reference = @attachable
                page.replace_html 'photos', :partial =>  '/admin/references/informations/photos'
              end
            end
          end
        end
      else
        format.html do
          responds_to_parent do
            render :update do |page|
              page.replace_html 'photos', :partial =>  'new'
            end
          end
        end
      end      
    end
  end

  def destroy
    @photo = Photo.find(params[:id])
    
    @photo.destroy
    respond_to do |format|
      format.js { render :partial => 'destroy'}
    end
  end
  
  private

  def find_attachable
    params.each do |name, value|
      if name=~ /(.+)_id$/
        return $1.classify.constantize.find(value)
      end
    end
    nil
  end

end
