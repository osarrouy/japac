class ContactsController < ApplicationController

	layout 'public'

	def show
		@contact = Contact.find(1)
		
		respond_to do |format|
			format.html
		end
	end

end
