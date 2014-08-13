require_dependency "ruby_wedding/application_controller"

module RubyWedding
  class Protected::GuestsController < Protected::BaseController
    def index
      @guests = RubyWedding::Guest.with_reply_details
    end
  end
end
