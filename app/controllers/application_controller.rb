class ApplicationController < ActionController::Base
  protect_from_forgery  

  def authenticate    
    if session[:user_id].blank?
      redirect_to root_url
    else
      @current_user = User.find session[:user_id]
      if params[:controller]=="users" and @current_user.role=="Admin"
        redirect_to interviews_path
      end
    end
  end

  def generate_xls_headers(filename)
    headers['Content-Type'] = "application/vnd.ms-excel"
    headers['Content-Disposition'] = "attachment; filename=\"#{filename}\""
    headers['Cache-Control'] = ''
  end
end
