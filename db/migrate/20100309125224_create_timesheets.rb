class CreateTimesheets < ActiveRecord::Migration
  def self.up
    create_table :timesheets do |t|
      t.date :weekday
    end
  end

  def self.down
    drop_table :timesheets
  end
end
