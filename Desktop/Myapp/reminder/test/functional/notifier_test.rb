require 'test_helper'

class NotifierTest < ActionMailer::TestCase
  test "reminder_received" do
    mail = Notifier.reminder_received
    assert_equal "Reminder received", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
