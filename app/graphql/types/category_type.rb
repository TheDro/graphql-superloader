require './app/graphql/loaders/super_loader.rb'

module Types
  class CategoryType < Types::BaseObject
    include Loaders::SuperLoader

    field :name, String, null: false
    field :products, [Types::ProductType], null: false

    def products
      fixed_lazy_loader(object, :products)
    end

  end
end