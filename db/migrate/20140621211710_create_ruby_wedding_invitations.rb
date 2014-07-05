class CreateRubyWeddingInvitations < ActiveRecord::Migration
  def change
    create_table :ruby_wedding_invitations do |t|

      t.timestamps
    end

    create_table :ruby_wedding_invitations_ruby_wedding_guests do |t|
      t.references :invitation, null: false
      t.references :guest, null: false
    end

  end
end
