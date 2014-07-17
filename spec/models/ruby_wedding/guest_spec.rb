require 'spec_helper'

module RubyWedding

  describe Guest do

    it { should have_and_belong_to_many(:invitations) }
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
