class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
    @products = @category.products
    @products = in_stock if params[:in_stock]
  end

  private

  def in_stock
    result = []
    @products.each do |product|
      result << product if product.stock > 0
    end
    result
  end
end
