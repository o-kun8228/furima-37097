class ItemsController < ApplicationController

  before_action :authenticate_user!,only:[:new]

  def index
    #@items = Item.all
  end

  def new
    @item = Item.new
    end

  def create
    @item = Item.new(item_params)
      if @item.save
        redirect_to root_path
  else
      render :new
    end
  end

  private
  def item_params
    params.require(:item).permit(:image, :brand_name, :price, :description_item, :category_id, :status_id, :fee_id, :send_day_id, :shipping_area_id, ).merge(user_id: current_user.id)
  end


end
