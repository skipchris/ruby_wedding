require 'spec_helper'

describe RubyWedding::Protected::BaseController do

  routes { RubyWedding::Engine.routes }

  context "logged out" do
    before { get :index }
    it { should redirect_to(login_path) }
  end

  context "logged in" do
    before { session[:ruby_wedding_logged_in] = true }

    describe 'get#index' do
      before { get :index }
      it { should render_template('index') }
    end
  end
end
