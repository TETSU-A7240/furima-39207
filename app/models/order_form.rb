class OrderForm
  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :postal_code, :region_id, :city, :address_number, :building, :tel_number, :order, :token

  with_options presence: true do
    validates :item_id
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :region_id, numericality: {other_than: 1, message: "can't be blank"}
    validates :city
    validates :address_number
    validates :tel_number, format: { with: /\A\d{10,11}\z/,message: "is invalid. Include hyphen(-)"}
    validates :user_id
    validates :token
  end

  def save(user_id)
    item = Item.find(item_id)
    order = Order.create(user_id: user_id, item_id: item_id)
    ShippingInformation.create(
      postal_code: postal_code,
      region_id: region_id,
      city: city,
      address_number: address_number,
      building: building,
      tel_number: tel_number,
      order_id: order.id
    )
  end  
end

