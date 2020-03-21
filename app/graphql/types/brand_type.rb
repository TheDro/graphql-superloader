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

    def fixed_products
      fixed_lazy_loader(object, :products)
    end



    field :reviews, [Types::ReviewType], null: false
    field :fixed_products, [Types::ProductType], null: false

    field :fixed_products_with_letter, [Types::ProductType], null: false do
      argument :letter, String, required: false
    end

    def fixed_products_with_letter(args)
      fixed_lazy_loader(object, :products, scope: Product.where(like('name', args[:letter])))
    end

    def reviews
      fixed_lazy_loader(object, :reviews)
    end


    def like(field, word)
      ["#{field} LIKE ?", "%" + word + "%"]
    end

  end
end