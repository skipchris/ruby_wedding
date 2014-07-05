module RubyWedding

  class Protected::BaseController < ApplicationController
    before_filter :logged_in?

    def index
    end

    private

    def logged_in?
      redirect_to login_path unless session[:ruby_wedding_logged_in] === true
    end
  end
end
