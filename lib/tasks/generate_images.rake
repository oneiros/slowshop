desc "Generate product images (takes some time...)"
task :generate_images => :environment do
  ActiveJob::Base.queue_adapter = :inline

  images = Category.all.map do |category|
    StringIO.new(RubyIdenticon.create(category.name, square_size: 256))
  end

  Product.find_each(batch_size: 100) do |product|
    image = images.sample
    product.image.attach(io: image, filename: "#{product.name}.png")
    image.rewind
  end
end
