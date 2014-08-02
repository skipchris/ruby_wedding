require 'spec_helper'

module RubyWedding
  describe Invitation do
    it { should have_many(:guests) }
    it { should accept_nested_attributes_for(:guests) }
    it { should ensure_length_of(:notes).is_at_most(2000) }

    # Class Methods
    describe 'self#find_by_guest_surname' do
      let(:guest1) { create(:guest, firstname: "Barry", surname: "Bobbins") }
      let(:guest2) { create(:guest, firstname: "Doris", surname: "Bobbins") }
      let(:guest3) { create(:guest, firstname: "Tim",   surname: "Krul") }
      let(:invitation1) { create(:invitation) }
      let(:invitation2) { create(:invitation) }
      before do
        invitation1.guests << guest1
        invitation1.guests << guest2
        invitation1.save
        invitation2.guests << guest3
        invitation2.save
      end
      it "locates the correct invitation" do
        expect(Invitation.find_by_guest_surname("Bobbins")).to include(invitation1)
        expect(Invitation.find_by_guest_surname("Krul")).to    include(invitation2)
        expect(Invitation.find_by_guest_surname("Hojo")).to    be_blank
      end
    end

    # Instance Methods
    describe 'guest_list' do
      context "1 guest" do
        before { subject.guests << build(:guest, firstname: "Jackson", surname: "Five") }
        it { expect(subject.guest_list).to eq("Jackson Five") }
      end
      context "0 guests" do
        it { expect(subject.guest_list).to eq("") }
      end
      context "2 guests" do
        before do
          subject.guests << build(:guest, firstname: "Jackson", surname: "Five")
          subject.guests << build(:guest, firstname: "Pollock", surname: "Cod")
        end
        it { expect(subject.guest_list).to eq("Jackson Five and Pollock Cod") }
      end
    end
  end
end
