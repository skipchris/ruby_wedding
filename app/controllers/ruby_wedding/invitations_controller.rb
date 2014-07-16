require_dependency "ruby_wedding/application_controller"

module RubyWedding
  class InvitationsController < ApplicationController
    def find
      @invitations = Invitation.find_by_guest_surname(params[:surname])
    end

    # TODO
    # Not really sure how this should work more generically...
    # I’m just doing what’s right for *my* wedding
    #
    def edit
      @invitation = Invitation.find(params[:id])
      @menu       = Menu.all.first
    end
  end
end
