module RubyWedding
  class Dish < ActiveRecord::Base
    belongs_to :course
    has_many :menu_choices
    has_many :guests, through: :menu_choices

    validates :name,
      presence: true
  end
end
