module RubyWedding
  class Course < ActiveRecord::Base
    belongs_to :menu
    has_many   :dishes
    default_scope -> { order('`order` ASC') }

    validates :name,
      presence: true
  end
end
