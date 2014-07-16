class CreateRubyWeddingMenus < ActiveRecord::Migration
  def change
    create_table :ruby_wedding_menus do |t|
      t.string :name

      t.timestamps
    end
  end
end
