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

  describe "POST create" do
    let(:app_attributes) { attributes_for(:app) }
    subject { post :create, app: app_attributes }

    describe "valid attributes" do
      it { subject; response.should render_template :create }
      it { subject; response.status.should eq 201 }

      it "should create an assignment" do
        expect { subject }.to change(Assignment, :count).by(1)
      end

    end

    describe "invalid attributes" do
      before { App.any_instance.stub(save: false) }
      it { subject; JSON.parse(response.body).should have_key "errors" }
      it { subject; expect(response.status).to be 406 }
    end
  end

end
