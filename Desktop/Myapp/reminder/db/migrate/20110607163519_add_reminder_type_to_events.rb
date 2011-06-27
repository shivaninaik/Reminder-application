class AddReminderTypeToEvents < ActiveRecord::Migration
  def self.up
    add_column :alerts, :reminder_type, :string
  end

  def self.down
    remove_column :alerts, :reminder_type
  end
end
