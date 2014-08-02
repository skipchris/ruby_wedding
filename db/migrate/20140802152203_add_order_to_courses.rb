class AddOrderToCourses < ActiveRecord::Migration
  def change
    add_column :ruby_wedding_courses, :order, :integer, null: false, default: 0
  end
end
