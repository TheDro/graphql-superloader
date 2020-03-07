
module Types
  class ProductType < Types::BaseObject
    field :name, String, null: false
    field :price, Float, null: false
    field :brand, Types::BrandType, null: false

  end
end