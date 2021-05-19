class ProductsController < ApplicationController
  def index
    @count = Product.count
    @page = (params[:page] || 0).to_i
    @products = Product
      .select(:id, :name, :category_id, :stock)
      .includes(:category)
      .order(:name)
      .offset(@page * Product::PER_PAGE)
      .limit(Product::PER_PAGE)
  end

  def show
    @product = Product.find(params[:id])
  end
end
