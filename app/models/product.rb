class Product < ApplicationRecord

  validates_presence_of :name, :currency
  validates :price, format: { with: /\A\d+(?:\.\d{0,2})?\z/ }, numericality: { greater_than: 0 }


end
