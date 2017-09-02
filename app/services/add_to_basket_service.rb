class AddToBasketService

  def initialize(basket, product)
    @order = basket
    @product = product
  end

  def call
    item = @order.order_items.find_or_initialize_by(product: @product, order: @order)
    item.increment(:amount) unless item.new_record?
    item.save
  end
end
