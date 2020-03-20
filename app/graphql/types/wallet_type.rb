require './app/graphql/loaders/super_loader.rb'

module Types
  class WalletType < Types::BaseObject
    include Loaders::SuperLoader

    field :money, Float, null: false

  end
end