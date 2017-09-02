class Order < ApplicationRecord
  belongs_to :user

  STATUSES = ['new', 'completed']

  scope :completed, -> { self.where(status: 'completed') }

  validates_presence_of :user, :total_price, :address, :email
  validates :status, inclusion: { in: Order::STATUSES }, presence: true
  validates :credit_card_number, presence: true, credit_card_number: true

end
