require './app/graphql/loaders/super_loader.rb'

module Types
  class BrandType < Types::BaseObject
    include Loaders::SuperLoader

    field :name, String, null: false
    field :products, [Types::ProductType], null: false

    field :products_with_letter, [Types::ProductType], null: false do
      argument :letter, String, required: false
    end

    def products
      lazy_loader(object, :products)
    end

    def products_with_letter(args)

      lazy_loader(object, :products, scope: Product.where(like('name', args[:letter])))
    end

    def like(field, word)
      return ["#{field} LIKE ?", "%" + word + "%"]
    end

  end
end