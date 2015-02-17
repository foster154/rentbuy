class PrequalsController < ApplicationController
  
  before_action :set_prequal, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @prequals = Prequal.all
    respond_with(@prequals)
  end

  def show
    respond_with(@prequal)
  end

  def new
    @guest = Guest.find(params[:guest_id])
    @prequal = Prequal.new
    respond_with(@prequal)
  end

  def edit

  end

  def create
    @prequal = Prequal.new(prequal_params)
    @prequal.save
    redirect_to edit_prequal_path(id: @prequal.id)
  end

  def update
    @prequal.update(prequal_params)
    respond_with(@prequal)
  end

  def destroy
    @prequal.destroy
    respond_with(@prequal)
  end

  private

    def set_prequal
      @prequal = Prequal.find(params[:id])
    end

    def prequal_params
      params.require(:prequal).permit(:guest_id, 
                                      :income, 
                                      :debt, 
                                      :down_payment, 
                                      :self_employed, 
                                      :first_time_buyer, 
                                      :military)
    end
end
