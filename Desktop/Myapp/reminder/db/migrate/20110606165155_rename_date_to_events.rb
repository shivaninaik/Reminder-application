class RenameDateToEvents < ActiveRecord::Migration
  def self.up
    rename_column :alerts, :rem_date, :reminder_time
  end

  def self.down
    rename_column :alerts, :reminder_time, :rem_date
  end
end
