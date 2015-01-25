require 'test_helper'

class GuestMailerTest < ActionMailer::TestCase
  test "request_form_submission" do
    mail = GuestMailer.request_form_submission
    assert_equal "Request form submission", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
