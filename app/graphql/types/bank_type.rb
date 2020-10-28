require './app/graphql/loaders/super_loader.rb'

module Types
  class BankType < Types::BaseObject
    include Loaders::SuperLoader

    field :name, String, null: false
    field :users, [Types::UserType], null: false

    def users
      fixed_lazy_loader(object, :users)
    end

  end
end