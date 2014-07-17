# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :ruby_wedding_menu_choice, :class => 'MenuChoice' do
    guest nil
    dish nil
  end
end
