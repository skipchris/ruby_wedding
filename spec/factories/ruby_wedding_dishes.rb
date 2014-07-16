# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :ruby_wedding_dish, :class => 'Dish' do
    name "MyString"
    course nil
  end
end
