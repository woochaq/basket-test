require 'rails_helper'

RSpec.describe InitializeBasketService do

  describe "InitializeBasketService #new.call" do
    before(:each) do
      @user = FactoryGirl.create(:user)
    end

    it "should create order with status new" do
      result = described_class.new(@user).call
      expect(result.class.name).to eq "Order"
      expect(result.id).to be_present
    end

    it "should return already created order with status new" do
      FactoryGirl.create(:order, user: @user, status: 'completed')
      order = FactoryGirl.create(:order, user: @user, status: 'new')
      result = described_class.new(@user).call
      expect(result).to eq order
    end

  end

end

