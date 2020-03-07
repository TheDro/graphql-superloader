class Brand < ApplicationRecord
  has_many :products, inverse_of: :brand
end
