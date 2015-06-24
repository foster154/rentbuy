class GuestMailer < ActionMailer::Base
  default from: "myrentwillbuy@gmail.com"

  def to_guest(guest)     # the initial email to the guest currently comes from the LENDER
    @guest = guest
    @lender = guest.account.users.where(role: 3).first
    if @lender.email_settings.send_to_guest?
      if Rails.env.production?
      	mail to: @guest.email, bcc: "myrentwillbuy@gmail.com", reply_to: @lender.email_settings.reply_to_address, subject: @lender.email_settings.to_guest_subject
      else
      	mail to: "foster154@gmail.com", bcc: "myrentwillbuy@gmail.com", reply_to: @lender.email_settings.reply_to_address, subject: @lender.email_settings.to_guest_subject, template_path: "guest_mailer/#{@guest.account.id}", template_name: "to_guest"
  	  end
    end
  end

  def to_agent(guest)   # new lead notification sent to the AGENT
    @guest = guest
    @agent = guest.account.users.where(role: 2).first
    if @agent.email_settings.new_lead_notification?
      if Rails.env.production?
      	mail to: @agent.email_settings.send_leads_to_address, bcc: "myrentwillbuy@gmail.com", subject: @agent.email_settings.new_lead_subject
      else
      	mail to: @agent.email_settings.send_leads_to_address, cc: "myrentwillbuy@gmail.com", subject: @agent.email_settings.new_lead_subject, template_path: "guest_mailer/#{@guest.account.id}", template_name: "to_agent"
  	  end
    end
  end

  def to_agent_update(guest)    # updated lead notification sent to the AGENT
    @guest = guest
    @agent = guest.account.users.where(role: 2).first
    if @agent.email_settings.updated_lead_notification?
      if Rails.env.production?
      	mail to: @agent.email_settings.send_leads_to_address, bcc: "myrentwillbuy@gmail.com", subject: @agent.email_settings.updated_lead_subject
      else
      	mail to: @agent.email_settings.send_leads_to_address, cc: "myrentwillbuy@gmail.com", subject: @agent.email_settings.updated_lead_subject, template_path: "guest_mailer/#{@guest.account.id}"
  	  end
    end
  end

  def to_lender(guest)    # new lead notification sent to the LENDER
    @guest = guest
    @lender = guest.account.users.where(role: 3).first
    if @lender.email_settings.new_lead_notification?
      if Rails.env.production?
        mail to: @lender.email_settings.send_leads_to_address, bcc: "myrentwillbuy@gmail.com, foster154@gmail.com", subject: @lender.email_settings.new_lead_subject
      else
        mail to: @lender.email_settings.send_leads_to_address, cc: "myrentwillbuy@gmail.com", subject: @lender.email_settings.new_lead_subject, template_path: "guest_mailer/#{@guest.account.id}", template_name: "to_agent"
      end
    end
  end

  def to_lender_update(guest)   # updated lead notification sent to the LENDER
    @guest = guest
    @lender = guest.account.users.where(role: 3).first
    if @lender.email_settings.updated_lead_notification?
      if Rails.env.production?
        mail to: @lender.email_settings.send_leads_to_address, bcc: "myrentwillbuy@gmail.com", subject: @lender.email_settings.updated_lead_subject
      else
        mail to: @lender.email_settings.send_leads_to_address, cc: "myrentwillbuy@gmail.com", subject: @lender.email_settings.updated_lead_subject, template_path: "guest_mailer/#{@guest.account.id}"
      end
    end
  end

  def to_guest_contents
    @email_content = File.open(@lender.to_guest_contents.url, "r")
  end

end
