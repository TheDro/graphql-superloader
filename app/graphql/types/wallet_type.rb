require './app/graphql/loaders/super_loader.rb'

module Types
  class WalletType < Types::BaseObject
    include Loaders::SuperLoader

    field :money, Float, null: false
    field :bank, Types::BankType, null: true

    def bank
      fixed_lazy_loader(object, :bank)
    end

  end
end