class Bank < ApplicationRecord
    has_many :wallets
    has_many :users, through: :wallets

    validates :name, presence: true
end
