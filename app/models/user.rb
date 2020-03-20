class User < ApplicationRecord
  validates :name, presence: true

  has_many :users_favorite_brands
  has_many :favorite_brands, through: :users_favorite_brands, source: :brand

  has_many :users_favorite_products
  has_many :favorite_products, through: :users_favorite_products, source: :product
end
