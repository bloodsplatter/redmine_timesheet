class TimesheetController < ApplicationController
  unloadable

  helper :issues
  include ApplicationHelper
  helper :timelog
  helper :timesheet

  def index
    @project = Project.find(1)
    #hash aanmaken met user als key en array van time entries als value
    
  end

  def to_pdf
  end
end
