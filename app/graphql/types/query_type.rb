module Types
  class QueryType < Types::BaseObject
    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    # TODO: remove me
    field :test_field, String, null: false,
      description: "An example field added by the generator"


    field :products, [Types::ProductType], null: false
    field :brands, [Types::BrandType], null: false
    field :users, [Types::UserType], null: false
    field :categories, [Types::CategoryType], null: false
    field :reviews, [Types::ReviewType], null: false


    def products
      Product.all
    end

    def brands
      Brand.all
    end

    def users
      User.all
    end

    def categories
      Category.all
    end

    def reviews
      Review.all
    end

    def test_field
      "Hello World!"
    end
  end
end
