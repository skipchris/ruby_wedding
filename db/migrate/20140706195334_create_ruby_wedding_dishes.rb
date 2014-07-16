class CreateRubyWeddingDishes < ActiveRecord::Migration
  def change
    create_table :ruby_wedding_dishes do |t|
      t.string :name
      t.references :course, index: true

      t.timestamps
    end
  end
end
