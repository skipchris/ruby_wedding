module RubyWedding
  class Guest < ActiveRecord::Base

    validates :firstname, presence: true

  end
end
