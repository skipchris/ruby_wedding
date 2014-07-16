class CreateRubyWeddingCourses < ActiveRecord::Migration
  def change
    create_table :ruby_wedding_courses do |t|
      t.string :name
      t.references :menu, index: true

      t.timestamps
    end
  end
end
