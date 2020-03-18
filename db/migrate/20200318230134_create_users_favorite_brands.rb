class CreateUsersFavoriteBrands < ActiveRecord::Migration[6.0]
  def change
    create_table :users_favorite_brands do |t|
      t.integer :user_id
      t.integer :brand_id
    end
  end
end
