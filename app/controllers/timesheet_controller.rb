class TimesheetController < ApplicationController
  unloadable
  
  helper "timesheet"
  helper_method :first_day_in_week, :last_day_in_week
  
  include Redmine::Export::PDF

  def index
    if params && params[:week] then
      @week = Date.parse(params[:week])
    else
      @week = Date.today
    end
    @project = Project.find(1)
    
    render :action => "index"
  end
  
  def pdf
    if params && params[:week] then
      @week = Date.parse(params[:week])
    else
      @week = Date.today
    end
    @project = Project.find(1)
    
    send_data(timesheet_to_pdf, :type => "application/pdf", :filename => "timesheet.pdf")
  end
  
  def first_day_in_week(datum)
    return unless datum.kind_of? Date
    
    datum - datum.wday + 1
  end
  
  def last_day_in_week(datum)
    return unless datum.kind_of? Date
    
    datum + (6 - datum.wday)
  end
  
  private
  
  def timesheet_to_pdf
    pdf = IFPDF.new('nl')
    pdf.SetCreator(Redmine::Info.app_name)
    pdf.SetFont("Arial")
    title = "WHARRGARBL Timesheet"
    pdf.SetTitle(title)
    pdf.AddPage("L")
    
    headers = {l(:user_heading), l(:issue_heading), l (:issue_description_heading), l (:init_planned_heading), l (:planned_heading), l (:issue_spent_heading),l (:issue_to_spend_heading), l (:issue_completion_heading)}
    
    #title
    pdf.SetFontStyle('B',16)
    pdf.Cell(190,10,title)
    pdf.Ln
    
    # subtitle
    subtitle = l(:timesheet_for) + " " + first_day_in_week(@week).strftime("%d/%m/%y") + " " + l(:and) + " " + last_day_in_week(@week).strftime("%d/%m/%y")
    pdf.Cell(190,10,subtitle)
    pdf.Ln
    
    #header
    pdf.SetFontStyle('B',12)
    pdf.SetFillColor(230, 230, 230)
    headers.each {|header| pdf.Cell 90, 10, header.to_s, 1, 1, 'C'}
    pdf.Ln
    
    pdf.Output
  end
end
