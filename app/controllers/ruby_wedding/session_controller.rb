module RubyWedding
  class SessionController < ApplicationController

    def new
    end

    def create
      if verify_user
        session[:ruby_wedding_logged_in] = true
        redirect_to protected_root_path
      else
        redirect_to login_path, alert: "Wrong password"
      end
    end

    def destroy
      session.delete(:ruby_wedding_logged_in)
      redirect_to login_path
    end

    private

    def verify_user
      params[:password].present? && params[:password] === ENV['ruby_wedding_password']
    end

  end
end
