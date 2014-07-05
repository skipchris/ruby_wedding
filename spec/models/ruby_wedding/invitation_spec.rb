require 'spec_helper'

module RubyWedding

  describe Invitation do
    describe "validations" do
      it { should have_and_belong_to_many(:guests) }
    end
  end

end