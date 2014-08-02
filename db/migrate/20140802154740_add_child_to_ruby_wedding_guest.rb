class AddChildToRubyWeddingGuest < ActiveRecord::Migration
  def change
    add_column :ruby_wedding_guests, :child, :boolean, null: false, default: false
  end
end
