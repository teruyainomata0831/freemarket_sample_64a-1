class Item < ApplicationRecord
  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images
  validates :name, :description, :price, :prefecture, presence: true
  validates :status,  :shipping_date, :shipping_fee, presence: true, numericality: { greater_than: 0 }
end

