FactoryGirl.define do
  factory :order do
    user { FactoryGirl.create(:user) }
    status "new"
    total_price "9.99"
    address "MyString"
    credit_card_number "378282246310005"
    email "test@example.com"
  end
end
