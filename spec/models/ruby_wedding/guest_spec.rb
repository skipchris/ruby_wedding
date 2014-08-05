module RubyWedding
  describe Guest do

    it { should belong_to(:invitation) }
    it { should have_many(:dishes).through(:menu_choices) }

    it { should accept_nested_attributes_for(:menu_choices) }

    describe "validations" do
      it { should validate_presence_of(:firstname) }
      it { should validate_presence_of(:surname) }
      it { should_not allow_value(nil).for(:child) }
    end

    describe "default scope" do
      before do
        [["Boris", "Middleton"], ["Adam", "Matthews"], ["Zoe", "Matthews"]].each do |g|
          create(:guest, firstname: g[0], surname: g[1])
        end
      end
      it "sorts by surname, firstname" do
        gs = RubyWedding::Guest.all
        expect(gs.first.fullname).to eq("Adam Matthews")
        expect(gs.second.fullname).to eq("Zoe Matthews")
        expect(gs.third.fullname).to eq("Boris Middleton")
      end
    end

    describe '#fullname' do
      let(:guest) { build(:guest) }
      it { expect(guest.fullname).to eq("Kim Hop") }
    end

  end
end
