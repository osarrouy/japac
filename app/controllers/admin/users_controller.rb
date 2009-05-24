class Admin::UsersController < ApplicationController

  layout 'admin'

  #before_filter :authorize

  def index
    @users = User.find(:all)
    
    respond_to do |format|
      format.html
    end
  end

  def new
    @user = User.new
    
    respond_to do |format|
      format.html
    end
  end

  def create
    # cookies.delete :auth_token
    # protects against session fixation attacks, wreaks havoc with 
    # request forgery protection.
    # uncomment at your own risk
    # reset_session
    @user = User.new(params[:user])
    
    respond_to do |format|
      if @user.save
        flash[:notice] = "L'utilisateur a été correctement enregistré"
        format.html { redirect_to admin_users_path }
      else
        format.html { render :action => 'new' }
      end
    end
  end

  def destroy
    @user = User.find(params[:id])
    
    if User.count > 1
      @user.destroy 
      flash[:notice] = 'L\'utilisateur a été correctement supprimé'
      respond_to do |format|
        format.html { redirect_to admin_users_url }
      end
    else
      flash[:notice] = 'Vous ne pouvez pas supprimer le dernier utilisateur'
      respond_to do |format|
        format.html { redirect_to admin_users_url }
      end
    end
  end

end
