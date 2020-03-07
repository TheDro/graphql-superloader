
module Types
  class ProductType < Types::BaseObject
    field :name, String, null: false
    field :price, Float, null: false

  end
end