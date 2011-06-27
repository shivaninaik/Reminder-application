class Alert < ActiveRecord::Base
  default_scope :order => 'reminder_time'
  belongs_to :user
  REMINDER_TYPES = ["Annyversary", "Birthday", "Appointment", "Personal", "Business"]
  validates :title, :reminder_time, :description, :presence => true
  validates :email, :presence => true
  validates :reminder_type, :inclusion => REMINDER_TYPES
  
  validate :expiration_date_cannot_be_in_the_past, :on => :create
  
  def expiration_date_cannot_be_in_the_past
    errors.add(:reminder_time, "Reminder date can not be past date") if reminder_time.present? && reminder_time < Time.now
  end

  def self.reminder_alert
    current_records = Alert.where("reminder_time < ? and status = ?", Time.now, false)
    
    current_records.each do |event|
      Notifier.reminder_received(event).deliver

      event.status = true
      event.save!
    end
  end
   
end
