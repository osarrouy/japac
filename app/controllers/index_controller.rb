class IndexController < ApplicationController
  
  layout 'public'
  
  def index
  end
  
  def contact
    @hd_title = "L'entreprise japac"
    respond_to do |format|
      format.html
    end
  end

end
