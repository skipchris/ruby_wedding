module RubyWedding
  class Invitation < ActiveRecord::Base
    has_many :guests, class_name: "RubyWedding::Guest"

    accepts_nested_attributes_for :guests

    validates :notes, length: { maximum: 2000 }

    def self.find_by_guest_surname(surname)
      # Is this 100% RDBMS-agnostic, or do we need to branch?
      joins(:guests).where('lower(ruby_wedding_guests.surname) = ?', surname.downcase).distinct
    end

    def guest_list
      guests.map(&:fullname).to_sentence(last_word_connector: ' & ')
    end

    def contains_children?
      guests.any?(&:child?)
    end

  end
end
