module RubyWedding
  class Guest < ActiveRecord::Base

    has_and_belongs_to_many :invitations, class_name: "RubyWedding::Invitation", join_table: 'ruby_wedding_invitations_ruby_wedding_guests'

    validates :firstname, presence: true
    validates :surname, presence: true

  end
end
