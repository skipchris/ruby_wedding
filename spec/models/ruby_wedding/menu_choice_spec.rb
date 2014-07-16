require 'spec_helper'

module RubyWedding
  describe MenuChoice do
    # Associations
    it { should belong_to(:guest) }
    it { should belong_to(:dish) }
    # Validations
  end
end
