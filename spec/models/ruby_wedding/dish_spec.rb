require 'spec_helper'

module RubyWedding
  describe Dish do
    # Associations
    it { should belong_to(:course) }
    it { should have_many(:guests).through(:menu_choices) }
    # Validations
    it { should validate_presence_of(:name) }
    it { should_not allow_value(nil).for(:vegetarian) }
  end
end
