class GuestMailer < ActionMailer::Base
  default from: "myrentwillbuy@gmail.com"

  def to_guest(guest)
    @guest = guest
    if Rails.env.production?
    	mail to: @guest.email, cc: "myrentwillbuy@gmail.com", bcc: "gcrum@iccu.com", reply_to: "gcrum@iccu.com", subject: "My Rent Will Buy: Congratuations!"
    else
    	mail to: "foster154@gmail.com", cc: "myrentwillbuy@gmail.com", reply_to: "gcrum@iccu.com", subject: "(DEV) My Rent Will Buy: Congratuations!"
	end
  end

  def to_agent(guest)
    @guest = guest
    if Rails.env.production?
    	mail to: "team.neal3@followupboss.me", cc: "myrentwillbuy@gmail.com", subject: "New Lead from My Rent Will Buy"
    else
    	mail to: "foster154@gmail.com", cc: "myrentwillbuy@gmail.com", subject: "(DEV) New Lead from My Rent Will Buy"
	end
  end

  def to_agent_update(guest)
    @guest = guest
    if Rails.env.production?
    	mail to: "team.neal3@followupboss.me", cc: "myrentwillbuy@gmail.com", subject: "Updated Lead from My Rent Will Buy"
    else
    	mail to: "foster154@gmail.com", cc: "myrentwillbuy@gmail.com", subject: "(DEV) Updated Lead from My Rent Will Buy"
	end
  end

  def to_lender(guest)
    @guest = guest
    if Rails.env.production?
      mail to: "gcrum@iccu.com", cc: "myrentwillbuy@gmail.com", subject: "New Lead from My Rent Will Buy"
    else
      mail to: "foster154@gmail.com", cc: "myrentwillbuy@gmail.com", subject: "(DEV) New Prequal Lead from My Rent Will Buy"
    end
  end

end
