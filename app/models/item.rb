class Item < ApplicationRecord
  has_one_attached :image


  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to :category
  belongs_to :condition
  belongs_to :postage
  belongs_to :region
  belongs_to :shipping_date

  validates :image, presence: true
  validates :item_name, presence: true
  validates :description, presence: true
  validates :price, presence: true

  validates :category_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :condition_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :postage_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :region_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :shipping_date_id, numericality: { other_than: 1 , message: "can't be blank"}

  validates :price, numericality: { greater_than_or_equal_to: 300,less_than_or_equal_to: 9999999,message: 'must be between ¥300 and ¥9,999,999', only_integer: true }

end
