class GuestsController < ApplicationController
  before_action :set_guest, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @guests = Guest.paginate(:page => params[:page]).order(created_at: :desc)
    respond_with(@guests)
  end

  def show
    @query = @guest.queries.last
    @areas = Area.all
    find_properties
  end

  def new
    @areas = Area.all
    @guest = Guest.new
    @guest.queries.build
    render layout: 'application-front'
  end

  def edit
    @query = @guest.queries.last
    @areas = Area.all
    find_properties
  end

  def create
    @guest = Guest.new(guest_params)
    @guest.save
    redirect_to results_path(id: @guest.id)
  end

  def update
    if @guest.update(guest_params)
      if @guest.preapproval.present?
        redirect_to new_prequal_path(guest_id: @guest.id)
      else
        redirect_to results_path(id: @guest.id)
      end
    else
      redirect_to results_path(id: @guest.id)
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

    def guest_params
      params.require(:guest).permit(:name, 
                                    :email,
                                    :want_list, 
                                    :beds, 
                                    :baths, 
                                    :sqft,
                                    :areas, 
                                    :preapproval,
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
