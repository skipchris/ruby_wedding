module RubyWedding
  class Menu < ActiveRecord::Base
    has_many :courses

    validates :name,
      presence: true
  end
end
