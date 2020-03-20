require './app/graphql/loaders/super_loader.rb'

module Types
  class UserType < Types::BaseObject
    include Loaders::SuperLoader

    field :id, Integer, null: false
    field :name, String, null: false
    field :favorite_brands, [Types::BrandType], null: false
    field :favorite_products, [Types::ProductType], null: false

    def favorite_brands
      Loaders::ManyToManyLoader.for(User, association_name: :favorite_brands).load(object)
    end

    def favorite_products
      Loaders::ManyToManyLoader.for(User, association_name: :favorite_products).load(object)
    end


    field :fixed_favorite_brands, [Types::BrandType], null: false
    field :fixed_favorite_products, [Types::ProductType], null: false


    def fixed_favorite_brands
      fixed_lazy_loader(object, :favorite_brands)
    end

    def fixed_favorite_products
      fixed_lazy_loader(object, :favorite_products)
    end

  end
end