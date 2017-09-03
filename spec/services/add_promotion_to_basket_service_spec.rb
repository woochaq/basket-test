require 'rails_helper'

RSpec.describe AddPromotionToBasketService do

  describe "AddPromotionToBasketService #new.call" do
    before(:each) do
      @order = FactoryGirl.create(:order)
      @promotion = FactoryGirl.create(:promotion, code: '123qwe', connectable: false)
    end

    it "should add promotion to basket and return notice" do
      result = described_class.new(@order, '123qwe').call
      expect(result[:notice]).to eq "Promotion added"
      expect(@order.promotions).to be_present
    end

    it "should return error if promotion doesn't exist" do
      result = described_class.new(@order, 'xxxxxx').call
      expect(result[:error]).to eq "Promotion doesn't exists"
    end

    it "should return errof if promotion already added" do
      described_class.new(@order, '123qwe').call
      result = described_class.new(@order, '123qwe').call
      expect(result[:error]).to eq "Promotion already added"
    end

    it "should return errof if promotion is not connectable" do
      described_class.new(@order, '123qwe').call
      FactoryGirl.create(:promotion, code: 'qwe123', connectable: true)
      result = described_class.new(@order, 'qwe123').call
      expect(result[:error]).to eq "Can't add promotion"
    end

  end

end

