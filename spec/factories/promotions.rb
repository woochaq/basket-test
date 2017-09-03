FactoryGirl.define do
  factory :promotion do
    code "20%OFF"
    kind "percent"
    discount 20
    connectable false
  end
end
