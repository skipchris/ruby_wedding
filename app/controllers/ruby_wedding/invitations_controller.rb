require_dependency "ruby_wedding/application_controller"

module RubyWedding
  class InvitationsController < ApplicationController
    def find
      @invitations = Invitation.find_by_guest_surname(params[:surname])
    end

    def show
      @invitation = Invitation.find(params[:id])
    end
  end
end
