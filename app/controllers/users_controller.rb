class UsersController < ApplicationController
  before_filter :authenticate,:except=>[:login,:verify_login,:logout]
  # GET /users
  # GET /users.xml
  def index
    @users = User.paginate(:per_page=>30,:page=>params[:page])
    respond_to do |format|
      format.html {
        if params["xls"] == 'true'
          @xls_users = User.all
          generate_xls_headers("Users-#{Time.now.strftime("%Y%m%d")}.xls")
          render 'index_xls', :layout => false
        else
          render 'index'
        end
      }
      format.xml  { render :xml => @users }
    end
  end

  # GET /users/1
  # GET /users/1.xml
  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @user }
    end
  end

  # GET /users/new
  # GET /users/new.xml
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.xml
  def create
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        format.html { redirect_to(@user, :notice => 'User was successfully created.') }
        format.xml  { render :xml => @user, :status => :created, :location => @user }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.xml
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to(@user, :notice => 'User was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.xml
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to(users_url) }
      format.xml  { head :ok }
    end
  end

  def login
    if session[:user_id].blank?
      render :layout=>false
    else
      redirect_to interviews_path
    end
  end

  def verify_login
    user_name=params[:login][:username]
    password=params[:login][:password]
    user = User.find_by_username_and_password(user_name,password)
    if user
      session[:user_id] = user.id
      session[:role] = user.role
      redirect_to interviews_path
    else
      @error = "username and password doesn't match"
      render "login", :layout=>false
    end
  end

  def search
    @search = User.search(params[:search])
    @users = @search.all.paginate(:per_page=>30,:page=>params[:page])
    respond_to do |format|
      format.html { 
        if params["xls"] == 'true'
          @xls_users = @search
          generate_xls_headers("Users-#{Time.now.strftime("%Y%m%d")}.xls")
          render 'index_xls', :layout => false
        else
          render 'index'
        end
      }
    end
  end

  def logout
    reset_session
    flash[:notice] = "Succesfully Logged  Out."
    redirect_to login_users_url
  end

  def change_password_form
    render :layout=>false
  end

  def change_password
    if params[:password] != @current_user.password
      @error = "Current password doesn't match"
    elsif params[:new_password] == ""
      @error = "Password can not be blank"
    elsif params[:new_password] != params[:confirm_password]
      @error = "new password and confirm password doesn't match"
    else
      @current_user.update_attribute(:password, params[:new_password])
    end
  end

  private

  def validate_admin
    flash[:notice] = "You Don't have access to this page."
    redirect_to :back unless @user.role=="SuperAdmin"
  end


end
