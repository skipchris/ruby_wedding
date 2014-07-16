module RubyWedding
  class Course < ActiveRecord::Base
    belongs_to :menu
    has_many   :dishes

    validates :name,
      presence: true
  end
end
