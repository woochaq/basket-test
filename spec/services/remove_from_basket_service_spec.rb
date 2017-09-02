require 'rails_helper'

RSpec.describe RemoveFromBasketService do

  describe "RemoveFromBasketService #new.call" do
    before(:each) do
      @order = FactoryGirl.create(:order)
      @product = FactoryGirl.create(:product)
    end

    it "should decrement and remove product from basket" do
      FactoryGirl.create(:order_item, order: @order, product: @product, amount: 2)
      expect(@order.order_items.first.amount).to eq 2
      described_class.new(@order, @product).call
      expect(@order.order_items.first.amount).to eq 1
      described_class.new(@order, @product).call
      expect(@order.order_items.count).to eq 0
    end

  end

end

