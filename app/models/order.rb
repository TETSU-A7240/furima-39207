class Order < ApplicationRecord

  has_one :shipping_information
  belongs_to :user
  belongs_to :item


end
