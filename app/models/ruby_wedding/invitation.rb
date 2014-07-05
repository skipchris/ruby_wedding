module RubyWedding
  class Invitation < ActiveRecord::Base
    has_and_belongs_to_many :guests, class_name: "RubyWedding::Guest", join_table: 'ruby_wedding_invitations_ruby_wedding_guests'
  end
end
