require './app/graphql/loaders/super_loader.rb'

module Types
  class ReviewType < Types::BaseObject
    include Loaders::SuperLoader

    field :comment, String, null: false
    field :rating, Float, null: false

  end
end