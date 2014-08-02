# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :course, :class => 'RubyWedding::Course' do
    name "MyString"
    menu nil
    order 0
  end
end
