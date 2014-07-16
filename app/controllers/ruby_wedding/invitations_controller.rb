require_dependency "ruby_wedding/application_controller"

module RubyWedding
  class InvitationsController < ApplicationController

    before_filter :find_invitation, only: [:edit, :update]

    def find
      @invitations = Invitation.find_by_guest_surname(params[:surname])
    end

    # TODO
    # Not really sure how this should work more generically...
    # I’m just doing what’s right for *my* wedding
    #
    def edit
      @menu = Menu.all.first
    end

    def update
      begin
        @invitation.update!(invitation_params)
        redirect_to thanks_invitation_path(@invitation)
      rescue => e
        @menu = Menu.all.first
        render :edit
      end
    end

    private

    def find_invitation
      @invitation = Invitation.find(params[:id])
    end

    def invitation_params
      params.require(:invitation)
    end

  end
end
