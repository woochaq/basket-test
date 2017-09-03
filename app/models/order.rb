class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items, dependent: :destroy
  has_and_belongs_to_many :promotions

  STATUSES = ['new', 'completed']

  scope :completed, -> { self.where(status: 'completed') }

  validates_presence_of :user, :total_price, :address, :email
  validates :status, inclusion: { in: Order::STATUSES }, presence: true
  validates :credit_card_number, presence: true, credit_card_number: true

  def count_total_price
    sum = self.order_items.sum{ |item| (item.product.price * item.amount) }
    self.promotions.each do |promotion|
      if promotion.kind == 'percent'
        sum -= (promotion.discount * sum)/100
      else
        sum -= promotion.discount
      end
    end
    sum = 0 if sum < 0
    sum.round(2)
  end

  def completed?
    self.status == 'completed'
  end

end
