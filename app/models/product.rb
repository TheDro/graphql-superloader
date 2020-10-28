class Product < ApplicationRecord
  belongs_to :brand, inverse_of: :products
  has_one :review, as: :reviewable
  has_and_belongs_to_many :categories

  validates :name, presence: true
  validates :price, presence: true
end
