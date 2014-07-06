require 'spec_helper'

module RubyWedding

  describe Invitation do
    it { should have_and_belong_to_many(:guests) }

    describe 'self#find_by_guest_surname', :focus do
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
  end
end
