class ProductsController < ApplicationController
  include FindProductConcern

  def index
    @products = Product.all
  end

  def add
    AddToBasketService.new(@basket, @product).call
    redirect_to products_path, notice: 'Product has been added'
  end

  def remove
    RemoveFromBasketService.new(@basket, @product).call
    redirect_to basket_path, notice: 'Product has been removed'
  end

end
