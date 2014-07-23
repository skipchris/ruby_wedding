require 'spec_helper'

module RubyWedding

  describe Guest do

    it { should belong_to(:invitation) }
    it { should have_many(:dishes).through(:menu_choices) }

    it { should accept_nested_attributes_for(:menu_choices) }

    describe "validations" do
      it { should validate_presence_of(:firstname) }
      it { should validate_presence_of(:surname) }
    end

    describe '#fullname' do
      let(:guest) { build(:guest) }
      it { expect(guest.fullname).to eq("Kim Hop") }
    end

  end
end
