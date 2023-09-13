class OrdersController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @item = Item.find(params[:item_id])
    @order_form = OrderForm.new
    @item = Item.find(params[:item_id])
    if current_user == @item.user || (@item.user != current_user && @item.orders.exists?)
      redirect_to root_path
    end
  end

  def create
    @item = Item.find(params[:item_id])
    @order_form = OrderForm.new(order_form_params)
    if @order_form.valid?
      pay_item
      @order_form.save(current_user.id)
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_form_params
    params.require(:order_form).permit(:postal_code, :region_id, :city, :address_number, :building, :tel_number)
    .merge(item_id: params[:item_id], user_id: current_user.id, token: params[:token])
  end
  
  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item[:price],
      card: order_form_params[:token],
      currency: 'jpy'
    )
  end
end