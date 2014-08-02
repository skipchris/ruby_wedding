FactoryGirl.define do
  factory :guest, class: RubyWedding::Guest do
    firstname "Kim"
    surname   "Hop"
    child     false
  end
end
