class Product < ApplicationRecord
  belongs_to :brand, inverse_of: :products
end
