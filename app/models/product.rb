class Product < ApplicationRecord
  belongs_to :brand, inverse_of: :products

  validates :name, presence: true
  validates :price, presence: true
end
