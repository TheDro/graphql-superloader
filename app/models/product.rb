class Product < ApplicationRecord
  belongs_to :brand, inverse_of: :products
  has_one :review, as: :reviewable

  validates :name, presence: true
  validates :price, presence: true
end
