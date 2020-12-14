class AddProductsCountToCategories < ActiveRecord::Migration[5.2]
  def change
    add_column :categories, :products_count, :integer, null: false, default: 0
  end
end
