module RubyWedding
  class Invitation < ActiveRecord::Base
    has_and_belongs_to_many :guests, class_name: "RubyWedding::Guest", join_table: 'ruby_wedding_invitations_ruby_wedding_guests'

    def self.find_by_guest_surname(surname)
      joins(:guests).where('ruby_wedding_guests.surname' => surname)
    end

  end
end
