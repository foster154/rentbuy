class PropertiesController < ApplicationController
  before_action :set_property, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @properties = Property.all
    respond_with(@properties)
  end

  def new
    @property = Property.new
    respond_with(@property)
  end

  def edit
  end

  def create
    @property = Property.new(property_params)
    set_payment_category
    flash[:notice] = 'Property was successfully added.' if @property.save
    redirect_to area_path(id: @property.area_id)
  end

  def update
    flash[:notice] = 'Property was successfully updated.' if @property.update(property_params)
    redirect_to area_path(id: @property.area_id)
  end

  def destroy
    @property.destroy
    redirect_to area_path(id: @property.area_id)
  end

  private
    def set_property
      @property = Property.find(params[:id])
    end

    def property_params
      params.require(:property).permit(:address, :beds, :baths, :payment, :area_id, :property_image)
    end
end
