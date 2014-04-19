require "spec_helper"

describe AppsController do

  let(:user) { build_stubbed(:user) }

  before do
    sign_in user
  end

  describe "GET index" do
    before do
      user.stub(apps: [App.new])
      get :index
    end

    it { response.should be_success }
    it { assigns(:apps).should have(1).apps }
    it { response.should render_template :index }
  end

  describe "GET show" do
    before do
      user.stub_chain(:apps, find: App.new)
      get :show, {id: 1}
    end

    it { response.should be_success }
    it { assigns(:app).should_not be_nil }
    it { response.should render_template :show }
  end

end