# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :ruby_wedding_course, :class => 'Course' do
    name "MyString"
    menu nil
  end
end
