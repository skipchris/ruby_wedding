require 'spec_helper'

module RubyWedding
  describe Course do
    # Associations
    it { should have_many(:dishes) }
    it { should belong_to(:menu) }
    # Validations
    it { should validate_presence_of(:name) }
  end
end
