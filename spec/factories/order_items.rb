FactoryGirl.define do
  factory :order_item do
    order { FactoryGirl.create(:order) }
    product { FactoryGirl.create(:product) }
    amount 1
  end
end
