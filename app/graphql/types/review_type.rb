require './app/graphql/loaders/super_loader.rb'

module Types
  class ReviewType < Types::BaseObject
    include Loaders::SuperLoader

    field :comment, String, null: false
    field :rating, Float, null: false
    field :reviewable, Types::Reviewable, null: false

    def reviewable
      fixed_lazy_loader(object, :reviewable)
    end

  end
end