require './app/graphql/loaders/super_loader.rb'

module Types
  class ProductType < Types::BaseObject
    include Loaders::SuperLoader

    field :name, String, null: false
    field :price, Float, null: false
    field :brand, Types::BrandType, null: false

    def brand
      lazy_loader(object, :brand)
    end

  end
end