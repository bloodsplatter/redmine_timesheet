class TimesheetController < ApplicationController
  unloadable
  
  helper "timesheet"
  
  include Redmine::Export::PDF

  def index
    if params && params[:week] then
      @week = Date.parse(params[:week])
    else
      @week = Date.today
    end
    @project = Project.find(1)
    
    respond_to do |format|
      format.html {render :action => "index"}
      format.pdf {send_data(), :type => "application/pdf", :name => "timesheet.pdf"}
    end
  end
  
  private
  
  def timesheet_to_pdf
    
  end
end
