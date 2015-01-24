class AreasController < ApplicationController
  before_action :set_area, only: [:show, :edit, :update, :destroy]

  respond_to :html

  helper_method :sort_column, :sort_direction

  def index
    @areas = Area.all
    respond_with(@areas)
  end

  def show
    @properties = Property.where(area_id: @area.id).order(sort_column + " " + sort_direction)
    respond_with(@area)
  end

  def new
    @area = Area.new
    respond_with(@area)
  end

  def edit
  end

  def create
    @area = Area.new(area_params)
    flash[:notice] = 'Area was successfully created.' if @area.save
    respond_with(@area)
  end

  def update
    flash[:notice] = 'Area was successfully updated.' if @area.update(area_params)
    respond_with(@area)
  end

  def destroy
    @area.destroy
    respond_with(@area)
  end

  private
    def set_area
      @area = Area.find(params[:id])
    end

    def area_params
      params.require(:area).permit(:name, :city, :state)
    end

    def sort_column
      Property.column_names.include?(params[:sort]) ? params[:sort] : "updated_at"  # set default sort column if none specified
    end

    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"  # set default sort order if none specified (& sanitize)
    end
end
