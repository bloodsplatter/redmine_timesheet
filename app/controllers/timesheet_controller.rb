class TimesheetController < ApplicationController
  unloadable
  
  helper "timesheet"

  def index
    if params && params[:week] then
      @week = Date.parse(params[:week])
    else
      @week = Date.today
    end
    @project = Project.find(1)
    render :action => "index" 
  end

  def to_pdf
    @project = Project.find(1)
    if params && params[:week] then
      @week = params[:week]
    else
      @week = Date.today
    end
    #maak pdf aan?
    render :pdf => "to_pdf"
  end
  
end
