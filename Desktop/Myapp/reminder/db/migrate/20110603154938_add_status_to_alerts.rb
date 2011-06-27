class AddStatusToAlerts < ActiveRecord::Migration
  def self.up
    add_column :alerts, :status, :boolean, :default => false
  end

  def self.down
    remove_column :alerts, :status
  end
end
