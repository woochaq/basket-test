FactoryGirl.define do
  factory :user do
    sequence :email do |n|
      "test#{n}@example.com"
    end
    password '123qweasd'
    password_confirmation '123qweasd'
  end
end
