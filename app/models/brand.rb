class Brand < ApplicationRecord
  has_many :products, inverse_of: :brand
  has_many :reviews, as: :reviewable

  validates :name, presence: true
end
