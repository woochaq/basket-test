class InitializeBasketService

  def initialize(user)
    @user = user
  end

  def call
    order = @user.orders.find_or_initialize_by(status: 'new')
    order.save(validate: false) if order.new_record?
    order
  end
end
