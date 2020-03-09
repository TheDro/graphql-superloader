require './app/graphql/loaders/super_loader.rb'

module Types
  class BrandType < Types::BaseObject
    include Loaders::SuperLoader

    field :name, String, null: false
    field :products, [Types::ProductType], null: false

    def products
      lazy_loader(object, :products)
    end

  end
end