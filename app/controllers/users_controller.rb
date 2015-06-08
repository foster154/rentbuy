class UsersController < ApplicationController
  before_filter :authenticate_user!

  def index
    @users = User.all
  end

  def edit
    @user = User.find(current_user.id)
  end

  def update
    @user = User.find(params[:id])
    if params[:password].blank?
      params.delete(:password)
      params.delete(:password_confirmation)
    end
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated."
      redirect_to profile_path
    else
      render 'edit'
    end
  end

  def show
    @user = User.find(current_user.id)
    unless @user == current_user
      redirect_to :back, :alert => "Access denied."
    end
  end

  private

  def user_params
      params.require(:user).permit(:name, 
                                   :email, 
                                   :phone, 
                                   :company, 
                                   :user_url,
                                   :other_info,
                                   :lender_number,
                                   :user_image,
                                   :password, 
                                   :password_confirmation)
  end

end
