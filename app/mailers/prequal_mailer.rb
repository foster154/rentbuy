class PrequalMailer < ActionMailer::Base
    default from: "myrentwillbuy@gmail.com"

  def prequal_submission_to_guest(prequal)
    @prequal = prequal
    if Rails.env.production?
    	mail to: @prequal.guest.email, cc: "myrentwillbuy@gmail.com", reply_to: "gcrum@iccu.com", subject: "My Rent Will Buy: Congratuations!"
    else
    	mail to: "foster154@gmail.com", cc: "myrentwillbuy@gmail.com", reply_to: "gcrum@iccu.com", subject: "(DEV) My Rent Will Buy: Congratuations!"
	  end
  end

  def prequal_submission_to_agent(prequal)
    @prequal = prequal
    if Rails.env.production?
    	mail to: "team.neal3@followupboss.me", cc: "myrentwillbuy@gmail.com", subject: "Updated Lead from My Rent Will Buy"
    else
    	mail to: "foster154@gmail.com", cc: "myrentwillbuy@gmail.com", subject: "(DEV) Updated Lead from My Rent Will Buy"
	  end
  end

  def prequal_submission_to_lender(prequal)
    @prequal = prequal
    if Rails.env.production?
      mail to: "gcrum@iccu.com", cc: "myrentwillbuy@gmail.com", subject: "New Lead from My Rent Will Buy"
    else
      mail to: "foster154@gmail.com", cc: "myrentwillbuy@gmail.com", subject: "(DEV) New Prequal Lead from My Rent Will Buy"
    end
  end
end
