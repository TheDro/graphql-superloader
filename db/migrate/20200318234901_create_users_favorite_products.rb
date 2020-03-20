class CreateUsersFavoriteProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :users_favorite_products do |t|
      t.integer :user_id
      t.integer :product_id
    end
  end
end
