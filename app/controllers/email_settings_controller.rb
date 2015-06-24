class EmailSettingsController < ApplicationController
  
	before_action :set_settings

  def edit
  end

  def update
  	if @settings.update(email_settings_params)
  		redirect_to email_settings_path
  		flash[:notice] = "Settings updated"
  	else
  		redirect_to :back
  		flash[:warning] = "Something went wrong!"
  	end
  end

  private

  def set_settings
  	@settings = EmailSettings.find_by user_id: current_user.id
  end

  def email_settings_params
	  params.require(:email_settings).permit(:reply_to_address,
	  								   :send_leads_to_address,
	  								   :send_to_guest,
	  								   :to_guest_subject,
                       :to_guest_contents,
	  								   :new_lead_notification,
	  								   :new_lead_subject,
	  								   :updated_lead_notification,
	  								   :updated_lead_subject)
end
end
