class RemoveFromBasketService

  def initialize(basket, product)
    @order = basket
    @product = product
  end

  def call
    item = @order.order_items.find_or_initialize_by(product: @product, order: @order)
    if item.present?
      if item.amount > 1
        item.decrement!(:amount)
      else
        item.destroy
      end
    end
  end
end
