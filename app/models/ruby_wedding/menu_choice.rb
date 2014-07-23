module RubyWedding
  class MenuChoice < ActiveRecord::Base
    belongs_to :guest
    belongs_to :dish
    belongs_to :course
  end
end
