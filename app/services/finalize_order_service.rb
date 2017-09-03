class FinalizeOrderService

  def initialize(order, attributes)
    @order = order
    @attributes = attributes.merge({ total_price: @order.count_total_price, status: 'completed' })
  end

  def call
    @order.update_attributes(@attributes)
    @order
  end

end
