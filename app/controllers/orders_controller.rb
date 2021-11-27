class OrdersController < ApplicationController

  def index
    @log_address = LogAddress.new
  end

  def create
  
    @log_address = LogAddress.new(log_params)
   
    if @log_address.valid?
      @log_address.save
      redirect_to root_path
    else
      render :index
    end


    private

    def log_params
      params.require(:log_address).permit(:postal_code, :shipping_area_id, :city, :address, :building_name, :phone_number, :buy_log).merge(user_id: :item.id)
    end


end
