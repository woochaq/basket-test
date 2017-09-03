class AddPromotionToBasketService

  def initialize(basket, code)
    @order = basket
    @code = code
    @promotion = Promotion.find_by_code(@code)
  end

  def call
    return { error: "Promotion doesn't exists" } if @promotion.nil?
    return { error: "Promotion already added" } if @order.promotions.include?(@promotion)
    if can_be_added?
      @order.promotions << @promotion
      @order.save(validate: false)
      return { notice: "Promotion added" }
    else
      return { error: "Can't add promotion" }
    end
  end

  private

    def can_be_added?
      return true if @order.promotions.empty?
      @order.promotions.all?(&:connectable) && @promotion.connectable?
    end
end
