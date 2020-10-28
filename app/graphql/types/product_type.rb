require './app/graphql/loaders/super_loader.rb'

module Types
  class ProductType < Types::BaseObject
    include Loaders::SuperLoader
    implements Types::Reviewable

    field :name, String, null: false
    field :price, Float, null: false
    field :brand, Types::BrandType, null: false

    field :review, Types::ReviewType, null: true
    field :categories, [Types::CategoryType], null: true

    def brand
      fixed_lazy_loader(object, :brand)
    end

    def review
      fixed_lazy_loader(object, :review)
    end

    def categories
      fixed_lazy_loader(object, :categories)
    end

  end
end