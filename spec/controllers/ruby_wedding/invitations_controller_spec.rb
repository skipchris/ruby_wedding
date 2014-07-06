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

      before do
        Invitation.stub(:find).and_return(mock_invitation)
        get :show, id: 1
      end

      it { expect(assigns(:invitation)).to eq(mock_invitation) }
      it { should render_template('invitations/show') }
      it { expect(response.status).to eq(200) }

    end

  end
end
