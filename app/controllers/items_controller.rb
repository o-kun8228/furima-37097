class ItemsController < ApplicationController

  before_action :authenticate_user!,only:[:new]

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
    end

  def create
      if @item.save
        redirect_to root_path
  else
      render :new
    end
  end

end
