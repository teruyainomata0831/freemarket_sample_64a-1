class Item < ApplicationRecord
  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images
  # belongs_to :user
  validates :name, :description, :price, presence: true
  validates :status, :prefecture, :shipping_date, :shipping_fee, presence: true, numericality: { greater_than: 0 }
end
