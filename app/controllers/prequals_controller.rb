class PrequalsController < ApplicationController
  
  before_action :set_prequal, only: [:show, :edit, :update, :destroy]
  before_action :check_session, only: [ :show ]

  respond_to :html

  def index
    redirect_to root_url
  end

  def show
    @guest = @prequal.guest
    respond_with(@prequal)
  end

  def new
    @prequal = Prequal.new
    respond_with(@prequal)
  end

  def edit
  end

  def create
    @prequal = Prequal.new(prequal_params)
    if @prequal.save
      redirect_to edit_prequal_path(@prequal)
    else
      redirect_to :back
    end
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

    def check_session
      unless request.session_options[:id] == @prequal.session_id
        redirect_to root_url
      end
    end

    def prequal_params
      params.require(:prequal).permit(:guest_id,
                                      :session_id,
                                      :name, 
                                      :income, 
                                      :debt, 
                                      :down_payment, 
                                      :self_employed, 
                                      :first_time_buyer, 
                                      :military,
                                      :yes_call,
                                      :yes_email,
                                      :prequal_phone,
                                      :prequal_email,
                                      :call_time)
    end
end
