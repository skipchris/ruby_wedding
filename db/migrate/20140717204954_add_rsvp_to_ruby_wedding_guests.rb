class AddRsvpToRubyWeddingGuests < ActiveRecord::Migration
  def change
    add_column :ruby_wedding_guests, :rsvp, :boolean
  end
end
