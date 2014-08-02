class AddNotesToInvitation < ActiveRecord::Migration
  def change
    add_column :ruby_wedding_invitations, :notes, :string, limit: 2000
  end
end
