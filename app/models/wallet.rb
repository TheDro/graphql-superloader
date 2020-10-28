class Wallet < ApplicationRecord
  belongs_to :user
  belongs_to :bank

  validates :money, presence: true
end
