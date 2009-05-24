class Admin::ContactsController < ApplicationController

	layout 'admin'
  
	before_filter :authorize

	def show
		@contact = Contact.find(1)
		
		respond_to do |format|
		  format.html
		end
	end


	def edit
		@contact = Contact.find(1)
		
		respond_to do |format|
		  format.html
		end
	end

	def update
		@contact = Contact.find(1)

		respond_to do |format|
		  if @contact.update_attributes(params[:contact])
		    format.html { render :action => 'show' }
		  else
		    format.html { render :action => 'edit' }
		  end
		end
	end

end
