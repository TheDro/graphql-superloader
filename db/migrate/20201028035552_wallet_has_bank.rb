class WalletHasBank < ActiveRecord::Migration[6.0]
  def change
    add_reference(:wallets, :bank, foreign_key: true)
  end
end
