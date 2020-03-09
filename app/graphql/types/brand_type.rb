load './app/graphql/loaders/foreign_key_loader.rb'

module Types
  class BrandType < Types::BaseObject
    field :name, String, null: false
    field :products, [Types::ProductType], null: false

    def products
      Loaders::ForeignKeyLoader.for(object, :products).load(object)
    end



  end
end