class Item < ApplicationRecord
  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images
  # belongs_to :user
  belongs_to :seller, class_name: 'User'
  
  validates :name, :description, :price, :region, presence: true
  validates :status,  :shipping_date, :shipping_fee, presence: true, exclusion: { in: %w(0) }
end
