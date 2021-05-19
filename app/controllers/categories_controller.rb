class CategoriesController < ApplicationController
  def index
    @categories = Category
      .includes(latest_products: {image_attachment: :blob})
      .all
  end

  def show
    @category = Category.find(params[:id])
    @products = @category.products
    @products = in_stock if params[:in_stock]
  end

  private

  def in_stock
    @products.where("products.stock > 0")
  end
end
