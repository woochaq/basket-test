class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :product

  validates_presence_of :order, :product, :amount
end
