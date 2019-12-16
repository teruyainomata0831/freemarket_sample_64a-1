class Item < ApplicationRecord
  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images
  validates :image_id, presence: true
  validates :contents, presence: true
end