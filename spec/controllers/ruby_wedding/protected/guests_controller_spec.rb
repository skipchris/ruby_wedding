require 'spec_helper'

module RubyWedding
  describe Protected::GuestsController do

    routes { RubyWedding::Engine.routes }

    should_inherit_from_controller(RubyWedding::Protected::BaseController)
    before { session[:ruby_wedding_logged_in] = true }

    describe 'GET index' do
      let(:guests) { double('guests') }
      before { allow(RubyWedding::Guest).to receive(:all).and_return(guests) }
      it "assigns @guests" do
        get :index
        expect(assigns(:guests)).to eq(guests)
      end
    end
  end
end
