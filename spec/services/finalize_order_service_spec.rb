require 'rails_helper'

RSpec.describe FinalizeOrderService do

  describe "FinalizeOrderService #new.call" do

    it "should add promotion to basket and return notice" do
      product = FactoryGirl.create(:product, price: 20)
      order_items = [FactoryGirl.build(:order_item, product: product, amount: 2)]
      order = FactoryGirl.build(:order, order_items: order_items)
      attributes = { credit_card_number: '378282246310005', email: 'test@example.com', address: 'Example address' }
      result = described_class.new(order, attributes).call
      expect(result).to be_valid
      expect(result.total_price).to eq 40.0
      expect(result.status).to eq 'completed'
    end

  end

end

