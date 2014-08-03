class AddVegetarianToRubyWeddingDishes < ActiveRecord::Migration
  def change
    add_column :ruby_wedding_dishes, :vegetarian, :boolean, default: false
  end
end
