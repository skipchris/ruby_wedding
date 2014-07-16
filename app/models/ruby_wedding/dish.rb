module RubyWedding
  class Dish < ActiveRecord::Base
    belongs_to :course

    validates :name,
      presence: true
  end
end
