require 'rails_helper'

RSpec.describe AddToBasketService do

  describe "AddToBasketService #new.call" do
    before(:each) do
      @order = FactoryGirl.create(:order)
      @product = FactoryGirl.create(:product)
    end

    it "should add product to order" do
      expect(@order.order_items.count).to eq 0
      described_class.new(@order, @product).call
      expect(@order.order_items.count).to eq 1
      expect(@order.order_items.first.amount).to eq 1
      described_class.new(@order, @product).call
      expect(@order.order_items.first.amount).to eq 2
    end

  end

end

