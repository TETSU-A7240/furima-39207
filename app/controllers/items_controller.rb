class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :destroy]
  before_action :find_item, only: [:edit, :update, :show, :destroy]
  
  def index
    @items = Item.order("created_at DESC")
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
  if current_user != @item.user
    redirect_to root_path
  end
end

def update
  if @item.update(item_params)
    redirect_to item_path(@item)
  else
    render :edit
  end
end

def destroy
  if current_user == @item.user
    @item.destroy
    redirect_to root_path
  else
    redirect_to root_path
  end
end

  private

  def find_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:image, :item_name, :price, :description, :condition_id, :category_id, :postage_id, :region_id, :shipping_date_id).merge(user_id: current_user.id)
  end
end