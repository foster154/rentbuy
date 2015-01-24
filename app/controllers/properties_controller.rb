class PropertiesController < ApplicationController
  before_action :set_property, only: [:show, :edit, :update, :destroy]

  respond_to :html

  helper_method :sort_column, :sort_direction

  def index
    @properties = Property.all.order(sort_column + " " + sort_direction)
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

    def sort_column
      Property.column_names.include?(params[:sort]) ? params[:sort] : "updated_at"  # set default sort column if none specified
    end

    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"  # set default sort order if none specified (& sanitize)
    end
end
