class OrdersController < ApplicationController

  def index
    @orders = current_user.orders.completed
  end

  def show
    @order = current_user.orders.find_by_id(params[:id])
  end

  def update
    @basket = FinalizeOrderService.new(@basket, order_params).call
    redirect_to @basket and return if @basket.valid? && @basket.completed?
    render template: 'basket/index'
  end

  private

    def order_params
      params.require(:order).permit(:address, :email, :credit_card_number)
    end

end
