require 'redmine'

require 'dispatcher'
Dispatcher.to_prepare :timesheet_plugin do
  # Needed for the compatibility check
  begin
    require_dependency 'time_entry_activity'
  rescue LoadError
    # TimeEntryActivity is not available
  end
end

Redmine::Plugin.register :redmine_timesheet do
  name 'Redmine Timesheet plugin'
  author 'Jonas Van der Aa'
  description 'This is a plugin for Redmine'
  version '0.0.1'
  
  menu :top_menu, :timesheet, {:controller => "timesheet", :action => "index"}, :caption => "Timesheet"
end
