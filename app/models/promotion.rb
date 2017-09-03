class Promotion < ApplicationRecord
  has_and_belongs_to_many :orders

  KINDS = ['percent', 'value']
  validates_presence_of :code, :discount
  validates :kind, inclusion: { in: Promotion::KINDS }, presence: true

end
