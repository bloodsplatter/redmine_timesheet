require 'redmine'

Redmine::Plugin.register :redmine_timesheet do
  name 'Redmine Timesheet plugin'
  author 'Jonas Van der Aa'
  description 'This is a plugin for Redmine'
  version '0.0.1'
  
  menu :top_menu, :timesheet, {:controller => "timesheet", :action => "index"}, :caption => "Timesheet"
end
