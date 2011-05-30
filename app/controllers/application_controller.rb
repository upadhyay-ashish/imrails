class ApplicationController < ActionController::Base
  protect_from_forgery  

  def authenticate    
    if session[:user_id].blank?
      redirect_to root_url
    else
      @user = User.find session[:user_id]
      if params[:controller]=="users" and @user.role=="Admin" 
        redirect_to interviews_path
      end
    end
  end
end
