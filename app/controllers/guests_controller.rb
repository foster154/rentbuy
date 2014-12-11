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
    @properties = Property.where(area_id: @query.area.id, payment: (@query.payment - 100)..(@query.payment + 100)).order(updated_at: :desc, payment: :desc).limit(3)
    render layout: 'application-front'
  end

  def new
    @areas = Area.all
    @guest = Guest.new
    @guest.queries.build
    render layout: 'application-front'
  end

  def edit
  end

  def create
    @guest = Guest.new(guest_params)
    flash[:notice] = 'Guest was successfully created.' if @guest.save
    redirect_to results_path(id: @guest.id)
  end

  def update
    flash[:notice] = 'Guest was successfully updated.' if @guest.update(guest_params)
    respond_with(@guest)
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
      params.require(:guest).permit(:name, :email, queries_attributes: [:guest_id, :area_id, :payment])
    end
end
