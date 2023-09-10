class Order < ApplicationRecord

  has_one :shipping_information
  belongs_to :user
  belongs_to :item


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
end
