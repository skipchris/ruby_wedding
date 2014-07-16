require 'spec_helper'

module RubyWedding
  describe InvitationsController do

    routes { RubyWedding::Engine.routes }

    describe "find" do
      let(:mock_invitations) { [double("Invitation")] }

      before do
        Invitation.stub(:find_by_guest_surname).and_return(mock_invitations)
        get :find
      end

      it { expect(assigns(:invitations)).to eq(mock_invitations) }
      it { should render_template('invitations/find') }
      it { expect(response.status).to eq(200) }
    end

    describe "show" do
      let(:mock_invitation) { double("Invitation") }
      let(:mock_menu)       { double("Menu") }

      before do
        Invitation.stub(:find).and_return(mock_invitation)
        get :show, id: 1
      end

      it { expect(assigns(:invitation)).to eq(mock_invitation) }
      it { should render_template('invitations/show') }
      it { expect(response.status).to eq(200) }

      context "A menu is present" do
        before { Menu.stub(:all).and_return(double('proxy', first: mock_menu)) }
        describe "instance vars" do
          before { get :show, id: 1 }
          it { expect(assigns(:menu)).to eq(mock_menu) }
        end
      end

      context "No menu is present" do
        before { Menu.stub(:all).and_return(double('proxy', first: nil)) }
        describe "instance vars" do
          before { get :show, id: 1 }
          it { expect(assigns(:menu)).to be_nil }
        end
      end
    end
  end
end
