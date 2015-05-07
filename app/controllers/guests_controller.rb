class GuestsController < ApplicationController

  before_action :set_guest, only: [:show, :step2, :step3, :step4, :results, :final, :edit, :update, :destroy]
  before_action :check_session, only: [ :results, :final ]

  respond_to :html

  def index
    @guests = Guest.paginate(:page => params[:page]).order(created_at: :desc)
    respond_with(@guests)
  end

  def new
    @guest = Guest.new
  end

  def step2
  end

  def step3
  end

  def step4
  end

  def results
  end

  def final
  end

  def edit
    @query = @guest.queries.last
    @areas = Area.all
    find_properties
  end

  def create
    @guest = Guest.new(guest_params)
    if @guest.save
      redirect_to step2_path(id: @guest.id)
    else
      redirect_to :back
      flash[:warning] = "Please enter a number for all fields."
    end
  end

  def update
    if params[:commit] == "On To Step 3 >>"
      if @guest.update(guest_params)
        redirect_to step3_path(id: @guest.id)
      else
        redirect_to :back
      end
    elsif params[:commit] == "Get My Number >>"
      if @guest.update(guest_params)
        redirect_to step4_path(id: @guest.id)
      else
        redirect_to :back
      end
    elsif params[:commit] == "Show My Results!"
      if @guest.update(guest_params)
        redirect_to results_path(id: @guest.id)
      else
        redirect_to :back
        flash[:warning] = "Please enter a valid email address."
      end
    elsif params[:commit] == "Submit"
      if @guest.update(guest_params)
        redirect_to final_path(id: @guest.id)
      else
        redirect_to :back
      end
    end
  end

  def destroy
    @guest.destroy
    respond_with(@guest)
  end

  private
    def set_guest
      @guest = Guest.find(params[:id])
    end

    def check_session
      redirect_to root_url unless request.session_options[:id] == @guest.session_id
    end

    def guest_params
      params.require(:guest).permit(:name, 
                                    :email,
                                    :want_list,
                                    :beds,
                                    :baths,
                                    :sqft,
                                    :areas, 
                                    :preapproval,
                                    :income,
                                    :debt,
                                    :down_payment,
                                    :self_employed,
                                    :first_time_buyer,
                                    :military,
                                    :yes_call,
                                    :yes_email,
                                    :phone,
                                    :call_time,
                                    :session_id,
                                    :email_page,
                                    :foreclosure_on_record,
                                    :sell_before_buy,
                                    :buy_within_six_months,
                                    queries_attributes: [:guest_id, :area_id, :payment])
    end

    def find_properties
      if @query.payment && @query.area
        @properties = Property.where(area_id: @query.area.id, payment: (@query.payment - 200)..(@query.payment + 200)).order(updated_at: :desc, payment: :desc).limit(3)
      elsif @query.payment && @query.area.blank?
        @properties = Property.where(payment: (@query.payment - 200)..(@query.payment + 200)).order(updated_at: :desc, payment: :desc).limit(3)
      elsif @query.payment.blank? && @query.area_id
        @properties = Property.where(area_id: @query.area.id).order(updated_at: :desc, payment: :desc).limit(3)
      else
        @properties = Property.all.order(updated_at: :desc, payment: :desc).limit(3)
      end
    end

end
