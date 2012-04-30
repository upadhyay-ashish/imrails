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

  def generate_csv_headers(filename)
    headers.merge!({
        'Cache-Control'             => 'must-revalidate, post-check=0, pre-check=0',
        'Content-Type'              => 'csv',
        'Content-Disposition'       => "attachment; filename=\"#{filename}\"",
        'Content-Transfer-Encoding' => 'binary'
      })
  end
end
