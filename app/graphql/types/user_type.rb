require './app/graphql/loaders/super_loader.rb'

module Types
  class UserType < Types::BaseObject
    include Loaders::SuperLoader

    field :id, Integer, null: false
    field :name, String, null: false
    field :favorite_brands, [Types::BrandType], null: false
    

    def favorite_brands
      Loaders::ManyToManyLoader.for(User, association_name: :favorite_brands).load(object)
    end

  end
end