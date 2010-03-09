class TimesheetController < ApplicationController
  unloadable

  helper :issues
  include ApplicationHelper
  helper :timelog

  def index
    
  end

  def to_pdf
  end
end
