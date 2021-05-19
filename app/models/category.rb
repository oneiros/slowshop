class Category < ApplicationRecord
  has_many :products
  has_many :latest_products,
    -> { where("products.id IN (SELECT id FROM products AS p WHERE p.category_id = products.category_id ORDER BY p.created_at DESC LIMIT 5)") },
    class_name: "Product"
end
