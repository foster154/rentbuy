class GuestMailer < ActionMailer::Base
  default from: "myrentwillbuy@gmail.com"

  def request_form_submission(guest)
    @guest = guest

    mail to: "team.neal3@followupboss.me", cc: "myrentwillbuy@gmail.com", subject: "New Lead from My Rent Will Buy"
  end
end
