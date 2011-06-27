class Notifier < ActionMailer::Base
  default :from => "sv241157@gmail.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifier.reminder_received.subject
  #
  def reminder_received(event)
    @event = event

    mail :to => event.email, :subject => 'Reminder alert'
  end
end
