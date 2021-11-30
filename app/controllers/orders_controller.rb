class OrdersController < ApplicationController

  before_action :authenticate_user!
  before_action :non_buy_item, only: [:index, :create]

  def index
    @log_address = LogAddress.new
  end

  

  def create
    
    @log_address = LogAddress.new(log_params)

    if @log_address.valid?

      Payjp.api_key = ENV['PAYJP_SECRET_KEY']
      Payjp::Charge.create(
        amount: @item.price,
        card: log_params[:token],
        currency: 'jpy'
      )
      @log_address.save
      redirect_to root_path
    else
      render :index
    end
  end


    private

    def log_params
      params.require(:log_address).permit(:postal_code, :shipping_area_id, :city, :address, :building_name, :phone_number,
                                          :buy_log).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
    end

    def non_buy_item
      # itemがあっての、order_form（入れ子構造）。他のコントローラーで生成されたitemを使うにはcreateアクションに定義する。
      @item = Item.find(params[:item_id])
      redirect_to root_path if current_user.id == @item.user_id || @item.buy_log.present?
    end

end