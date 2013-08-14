# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :order_day do
    day "monday"
    duration Random.rand(1..7)
  end
end
