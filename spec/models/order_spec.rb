require 'rails_helper'

RSpec.describe Order, type: :model do

  describe "#completed" do
    it "should return only completed orders" do
      2.times{ FactoryGirl.create(:order, status: 'new') }
      3.times{ FactoryGirl.create(:order, status: 'completed') }
      expect(described_class.completed.count).to eq 3
    end
  end

  describe "#count_total_price" do
    it "should return 0 when no order_items" do
      order = FactoryGirl.create(:order)
      expect(order.order_items.count).to eq 0
      expect(order.count_total_price).to eq 0.0
    end

    it "should return 0 when no order_items" do
      order = FactoryGirl.create(:order)
      product = FactoryGirl.create(:product, price: 9.99)
      FactoryGirl.create(:order_item, order: order, product: product, amount: 2)
      expect(order.count_total_price.to_s).to eq '19.98'
    end
  end

  describe "#completed?" do
    it "should return false if order status is new" do
      order = FactoryGirl.create(:order, status: 'new')
      expect(order.completed?).to eq false
    end

    it "should return true if order status is completed" do
      order = FactoryGirl.create(:order, status: 'completed')
      expect(order.completed?).to eq true
    end

  end

end
