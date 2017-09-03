class CreateOrdersPromotions < ActiveRecord::Migration[5.1]
  def change
    create_table :orders_promotions do |t|
      t.belongs_to :order, index: true
      t.belongs_to :promotion, index: true
    end
  end
end
