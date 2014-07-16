require 'spec_helper'

module RubyWedding
  describe Menu do
    #associations
    it { should have_many(:courses) }
    #validations
    it { should validate_presence_of(:name) }
  end
end
