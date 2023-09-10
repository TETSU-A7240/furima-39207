class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @order_form = OrderForm.new
  end

  def create
    @item = Item.find(params[:item_id])
    @order_form = OrderForm.new(order_form_params)
    if @order_form.valid?
      @order_form.save(current_user.id)
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_form_params
    params.require(:order_form).permit(:postal_code, :region_id, :city, :address_number, :building, :tel_number)
    .merge(item_id: params[:item_id], user_id: current_user.id)
  end
end