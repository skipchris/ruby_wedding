# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :dish, :class => 'RubyWedding::Dish' do
    name "Deliciousness"
    course nil
    vegetarian false
  end
end
