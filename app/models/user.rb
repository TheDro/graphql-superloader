class User < ApplicationRecord
  validates :name, presence: true

  has_many :users_favorite_brands
  has_many :favorite_brands, through: :users_favorite_brands, source: :brand
end
