require 'rails_helper'

RSpec.describe Order, type: :model do

  describe "#completed" do
    it "should return only completed orders" do
      2.times{ FactoryGirl.create(:order, status: 'new') }
      3.times{ FactoryGirl.create(:order, status: 'completed') }
      expect(described_class.completed.count).to eq 3
    end
  end
end
