require 'iconv'
class InterviewsController < ApplicationController
  before_filter :authenticate
  # GET /interviews
  # GET /interviews.xml
  def index
    params[:page] ||=1    
    @interviews = Interview.paginate(:per_page=>9,:page=>params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @interviews }
      format.csv {  generate_csv_headers("Interview-#{Time.now.strftime("%Y%m%d")}") }
    end
  end

  # GET /interviews/1
  # GET /interviews/1.xml
  def show
    @interview = Interview.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @interview }
    end
  end

  # GET /interviews/new
  # GET /interviews/new.xml
  def new
    @interview = Interview.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @interview }
    end
  end

  # GET /interviews/1/edit
  def edit
    @interview = Interview.find(params[:id])
  end

  # POST /interviews
  # POST /interviews.xml
  def create
    @interview = Interview.new(params[:interview])

    respond_to do |format|
      if @interview.save
        format.html { redirect_to(@interview, :notice => 'Interview was successfully created.') }
        format.xml  { render :xml => @interview, :status => :created, :location => @interview }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @interview.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /interviews/1
  # PUT /interviews/1.xml
  def update
    @interview = Interview.find(params[:id])

    respond_to do |format|
      if @interview.update_attributes(params[:interview])
        format.html { redirect_to(@interview, :notice => 'Interview was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @interview.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /interviews/1
  # DELETE /interviews/1.xml
  def destroy
    @interview = Interview.find(params[:id])
    @interview.destroy

    respond_to do |format|
      format.html { redirect_to(interviews_url) }
      format.xml  { head :ok }
    end
  end

  def csv_upload
    
  end
  
  def import_csv
    #   begin
    file = params[:csv_import][:file]
    logcount=0
    Interview.transaction do
      FasterCSV.parse(file.tempfile, :headers => true) do |row|
        Interview.create!(row.to_hash)
        logcount += 1
      end
    end
    flash[:notice] = "Successfully added #{logcount} Participant(s)."
    redirect_to interviews_path
    #    rescue => exception
    #      # If an exception is thrown, the transaction rolls back and we end up in this rescue block
    #      error = ERB::Util.h(exception.to_s) # get the error and HTML escape it
    #      flash[:error] = "Error adding logs.  (#{error}).  Please try again."
    #      redirect_to csv_upload_interviews_url
    #   end
  end

  def upload_personal_doc
    @interview = Interview.find params[:id]
    render :layout => "popup"
  end

  def import_personal_doc    
    @interview = Interview.find(params[:id])
    @attachment = @interview.attachments.new(params[:attachment])
    @attachment.save
  end
  
  def download_attachment
    @attachment = Attachment.find(params[:attachment_id])
    send_file @attachment.data.path
  end

  def search    
    @search = Interview.search(params[:search])
    @interviews = @search.all.paginate(:per_page=>9,:page=>params[:page])
    respond_to do |format|
      format.csv do
        generate_csv_headers("Interview-#{Time.now.strftime("%Y%m%d")}")
        render :action=>:index
      end
      format.html { render :action=>:index }
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

  def get_content_to_display
    respond_to do |format|
      render :update do |page|
        page.replace_html "mainBox", :partial => 'page1'
      end
    end
  end
end
