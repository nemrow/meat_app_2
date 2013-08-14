# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :inventory do
    quantity Random.rand(20..200)
  end
end
