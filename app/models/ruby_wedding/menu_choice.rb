module RubyWedding
  class MenuChoice < ActiveRecord::Base
    belongs_to :guest
    belongs_to :dish
  end
end
