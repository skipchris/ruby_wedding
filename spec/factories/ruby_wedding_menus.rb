# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :menu, :class => 'RubyWedding::Menu' do
    name "Day Menu"
  end
end
