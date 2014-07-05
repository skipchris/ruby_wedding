require 'spec_helper'

module RubyWedding

  describe Guest do
    describe "validations" do
      it { should validate_presence_of(:firstname) }
      it { should validate_presence_of(:surname) }
      it { should have_and_belong_to_many(:invitations) }
    end
  end

end