categories = (1..35).map do |i|
  Category.create!(name: Faker::Commerce.unique.department)
end

categories.each do |category|
  amount = rand(200..800)
  puts "creating #{amount} products for \"#{category.name}\""
  amount.times do
    product = Product.create!(
      category: category,
      name: Faker::Commerce.product_name,
      description: Faker::Lorem.paragraphs(number: rand(2..6)),
      comment: Faker::Lorem.paragraphs(number: rand(1..4)),
      stock: rand(0..100),
      ean: Faker::Barcode.unique.ean(13),
      product_code: Faker::Number.unique.number(digits: 20),
      available_from: Date.today.ago(rand(1..90).days),
      metadata: Faker::Types.complex_rb_hash(number: rand(2..10))
    )
  end
end
