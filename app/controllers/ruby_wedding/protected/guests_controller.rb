require_dependency "ruby_wedding/application_controller"

module RubyWedding
  class Protected::GuestsController < Protected::BaseController
    def index
      @guests = RubyWedding::Guest.all
    end
  end
end
