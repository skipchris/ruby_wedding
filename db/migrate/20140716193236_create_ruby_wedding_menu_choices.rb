class CreateRubyWeddingMenuChoices < ActiveRecord::Migration
  def change
    create_table :ruby_wedding_menu_choices do |t|
      t.references :guest, index: true
      t.references :dish, index: true

      t.timestamps
    end
  end
end
