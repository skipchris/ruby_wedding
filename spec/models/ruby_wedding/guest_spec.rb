require 'spec_helper'

module RubyWedding

  describe Guest do
    describe "validations" do
      it { should validate_presence_of(:firstname) }
    end
  end

end