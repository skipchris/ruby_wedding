require_dependency "ruby_wedding/application_controller"

module RubyWedding
  class InvitationsController < ApplicationController

    before_filter :find_invitation_and_menu, only: [:edit, :update]

    def find
      @invitations = Invitation.find_by_guest_surname(params[:surname])
    end

    def edit
    end

    def update
      if @invitation.update(invitation_params)
        redirect_to thanks_invitation_path(@invitation)
      else
        render :edit
      end
    end

    def thanks
    end

    private

    def find_invitation_and_menu
      @invitation = Invitation.find(params[:id])
      # TODO
      # Not really sure how this should work more generically...
      # I’m just doing what’s right for *my* wedding
      #
      @menu = Menu.all.first
      @invitation.guests.each do |guest|
        @menu.courses.each do |course|
          guest.menu_choices.build(course_id: course.id) unless guest.menu_choices.where(course_id: course.id)
        end
      end
    end

    def invitation_params
      params.require(:invitation).permit(guests_attributes: [:rsvp, { :menu_choices_attributes => [:dish_id, :course_id] }, :id])
    end

  end
end
