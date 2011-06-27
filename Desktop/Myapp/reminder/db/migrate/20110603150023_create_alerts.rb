class CreateAlerts < ActiveRecord::Migration
  def self.up
    create_table :alerts do |t|
      t.string :title
      t.datetime :rem_date
      t.string :description
      t.string :email

      t.timestamps
    end
  end

  def self.down
    drop_table :alerts
  end
end
