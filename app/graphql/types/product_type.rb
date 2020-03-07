require './app/graphql/loaders/record_loader.rb'

module Types
  class ProductType < Types::BaseObject
    field :name, String, null: false
    field :price, Float, null: false
    field :brand, Types::BrandType, null: false

    def brand
      Loaders::RecordLoader.for(Brand).load(object.brand_id)
    end

  end
end