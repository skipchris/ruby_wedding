require_dependency "ruby_wedding/application_controller"

module RubyWedding
  class InvitationsController < ApplicationController

    before_filter :find_invitation_and_menu, only: [:edit, :update]
    layout 'application'

    def find
      @invitations = Invitation.find_by_guest_surname(params[:surname])
      if @invitations.count === 1
        redirect_to edit_invitation_path(@invitations.first)
      elsif @invitations.blank?
        render :not_found
      else
        render :find
      end
    end

    def edit
      prep_guests_for_form
    end

    def update
      if @invitation.update(invitation_params)
        redirect_to thanks_invitation_path(@invitation)
      else
        prep_guests_for_form
        render :edit
      end
    end

    def thanks
    end

    private

    def find_invitation_and_menu
      @invitation = Invitation.find(params[:id])
      @menu = Menu.all.first
    end

    def prep_guests_for_form
      # TODO
      # Not really sure how this should work more generically...
      # I’m just doing what’s right for *my* wedding
      #
      if @menu.present? && @menu.courses.present?
        @invitation.guests.each do |guest|
          @menu.courses.each do |course|
            guest.menu_choices.build(course_id: course.id) unless guest.menu_choices.find_index { |obj| obj.course_id == course.id }
          end
        end
      end
    end

    def invitation_params
      params.require(:invitation).permit(
        { guests_attributes: [:rsvp, { :menu_choices_attributes => [:dish_id, :course_id] }, :id] },
        :notes
      )
    end

  end
end
