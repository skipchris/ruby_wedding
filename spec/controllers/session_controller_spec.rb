describe RubyWedding::SessionController do

  # Setting this as an instance variable in a config.before block didn’t work.
  routes { RubyWedding::Engine.routes }

  before { ENV['ruby_wedding_password'] = '1234' }

  describe 'get#new' do
    before { get :new }
    it { should render_template('new') }
    it "sends back 200 ok" do
      expect(response.status).to eq 200
    end
  end

  describe 'post#create' do
    let(:params) {{}}
    context "password is correct" do
      before do
        params[:password] = '1234'
        post :create, params
      end
      it { should redirect_to protected_root_path }
      it { should_not set_the_flash }
      it { should set_session(:ruby_wedding_logged_in).to true }
    end
    context "password is incorrect" do
      before do
        params[:password] = '4567'
        post :create, params
      end
      it { should set_the_flash.to "Wrong password" }
      it { should redirect_to login_path }
      it { should_not set_session(:ruby_wedding_logged_in) }
    end
  end

  describe 'delete#destroy' do
    before { delete :destroy, {}, { ruby_wedding_logged_in: true } }
    it "removes the logged in bit from the session hash" do
      expect(session[:ruby_wedding_logged_in]).to be_nil
    end
    it { should redirect_to login_path }
  end

end
