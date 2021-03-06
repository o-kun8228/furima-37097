class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :destroy]
  before_action :move_to_index, only: [:edit, :update, :show, :destroy]

  def index
    @items = Item.order(created_at: :desc)
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

  def show
    
  end

  def edit
    return redirect_to root_path if @item.user_id != current_user.id || @item.buy_log.present?
  end


  def update

    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit
    end

  end

  def destroy
    if @item.destroy
      redirect_to root_path
    else
      render :show
    end
  end
  private

  def item_params
    params.require(:item).permit(:image, :brand_name, :price, :description_item, :category_id, :status_id, :fee_id, :send_day_id,
                                 :shipping_area_id).merge(user_id: current_user.id)
  end

  def move_to_index
    @item = Item.find(params[:id])
  end


end
