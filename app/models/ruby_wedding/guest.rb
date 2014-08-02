module RubyWedding
  class Guest < ActiveRecord::Base

    belongs_to :invitation, class_name: "RubyWedding::Invitation"
    has_many :menu_choices
    has_many :dishes, through: :menu_choices

    accepts_nested_attributes_for :menu_choices

    validates :firstname, presence: true
    validates :surname, presence: true
    validates :child, inclusion: { in: [true, false] }

    def fullname
      "#{firstname} #{surname}"
    end

  end
end
