class BasketController < ApplicationController

  def index
  end

  def promotions
    result = AddPromotionToBasketService.new(@basket, params[:code]).call
    flash[result.keys[0]] = result.values[0]
    redirect_to basket_path
  end

  def delete_promotion
    promotion = @basket.promotions.find_by_id(params[:id])
    @basket.promotions.delete(promotion)
    redirect_to basket_path
  end

end
