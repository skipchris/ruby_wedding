module RubyWedding
  class Invitation < ActiveRecord::Base
    has_many :guests, class_name: "RubyWedding::Guest"

    accepts_nested_attributes_for :guests

    def self.find_by_guest_surname(surname)
      includes(:guests).where('ruby_wedding_guests.surname' => surname).distinct
    end
  end
end
