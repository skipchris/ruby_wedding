module RubyWedding
  describe Course do
    # Associations
    it { should have_many(:dishes) }
    it { should belong_to(:menu) }
    # Validations
    it { should validate_presence_of(:name) }

    # Scopes
    describe 'default scope' do
      let(:menu) { create(:menu) }
      before do
        menu.courses << create(:course, name: "Puds", order: 2)
        menu.courses << create(:course, name: "Starters", order: 1)
      end
      it "Orders the courses by order ASC" do
        expect(menu.courses.first.name).to eq("Starters")
        expect(menu.courses.last.name).to eq("Puds")
      end
    end

  end
end
