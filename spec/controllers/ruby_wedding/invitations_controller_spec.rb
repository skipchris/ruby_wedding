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

    describe "edit" do
      let(:mock_invitation) { double("Invitation") }
      let(:mock_menu)       { double("Menu") }

      before do
        Invitation.stub(:find).and_return(mock_invitation)
        get :edit, id: 1
      end

      it { expect(assigns(:invitation)).to eq(mock_invitation) }
      it { should render_template('invitations/edit') }
      it { expect(response.status).to eq(200) }

      context "A menu is present" do
        before { Menu.stub(:all).and_return(double('proxy', first: mock_menu)) }
        describe "instance vars" do
          before { get :edit, id: 1 }
          it { expect(assigns(:menu)).to eq(mock_menu) }
        end
      end

      context "No menu is present" do
        before { Menu.stub(:all).and_return(double('proxy', first: nil)) }
        describe "instance vars" do
          before { get :edit, id: 1 }
          it { expect(assigns(:menu)).to be_nil }
        end
      end
    end


    describe "update" do
      let(:mock_invitation) { double("Invitation", to_param: 1) }
      let(:mock_menu)       { double("Menu") }

      before do
        Invitation.stub(:find).and_return(mock_invitation)
      end

      context "saves successfully" do
        before do
          mock_invitation.stub(:update!).and_return(true)
          put :update, id: 1
        end
        it { should redirect_to(:thanks_invitation) }
      end

      context "save fails" do
        before do
          mock_invitation.stub(:update!).and_raise("pow")
          Menu.stub(:all).and_return(double('proxy', first: mock_menu))
          put :update, id: 1
        end

        it { expect(assigns(:menu)).to eq(mock_menu) }
        it { expect(assigns(:invitation)).to eq(mock_invitation) }
        it { should render_template('invitations/edit') }
        it { expect(response.status).to eq(200) }
      end
    end
  end
end
