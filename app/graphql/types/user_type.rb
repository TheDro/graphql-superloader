require './app/graphql/loaders/super_loader.rb'

module Types
  class UserType < Types::BaseObject
    include Loaders::SuperLoader

    field :id, Integer, null: false
    field :name, String, null: false

  end
end