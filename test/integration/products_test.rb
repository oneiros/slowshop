require 'test_helper'

class ProductsTest < ActionDispatch::IntegrationTest
  test "no n+1 on index page" do
    populate = ->(n) {
      n.times do |i|
        Product.create!(
          name: "product#{i}",
          category: categories(:one)
        )
      end
    }

    assert_perform_constant_number_of_queries(populate: populate) do
      get "/products"
    end
  end
end
