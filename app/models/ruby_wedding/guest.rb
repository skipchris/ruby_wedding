module RubyWedding
  class Guest < ActiveRecord::Base

    has_and_belongs_to_many :invitations, class_name: "RubyWedding::Invitation", join_table: 'ruby_wedding_invitations_ruby_wedding_guests'
    has_many :menu_choices
    has_many :dishes, through: :menu_choices

    accepts_nested_attributes_for :menu_choices

    validates :firstname, presence: true
    validates :surname, presence: true

    def fullname
      "#{firstname} #{surname}"
    end

  end
end
