require 'spec_helper'

describe BuildsController do

  sign_in_user

  let(:app) { FactoryGirl.build(:app, :with_single_build) }
  let(:build) { app.builds.first }

  describe "GET index" do
    before do
      App.stub(find: app)
      app.builds.stub(all: [build])
      get :index, app_id: 1
    end

    it { response.should render_template :index }
    it { assigns(:builds).should eq [build] }
  end

  describe "GET show" do
    before do
      App.stub(find: app)
      app.builds.stub(find: build)

      # Stubbing render in order to establish
      # message expectation
      # http://stackoverflow.com/questions/4701108/rspec-send-file-testing
      controller.stub(:render)
    end

    subject { get :show, app_id: 1, id: 1 }

    it { subject; expect(assigns(:build)).to eq build }
    it { subject; expect(response).to be_success }
    it { controller.should_receive(:send_file).with(build.apk.file.path); subject }
  end

  describe "POST create" do
    let(:build_attributes) { {app_id: 1, build_token: 123, build: attributes_for(:build)} }
    subject { post :create, build_attributes }

    before do
      App.stub(find_by_build_token: app)
      Build.stub(find: build)
    end

    describe "valid attributes" do
      before { Build.any_instance.stub(save: true) }
      it { subject; response.should render_template :create }
      it { subject; response.status.should eq 201 }
    end

    describe "invalid attributes" do
      before { Build.any_instance.stub(save: false) }
      it { subject; JSON.parse(response.body).should have_key "errors" }
      it { subject; expect(response.status).to be 406 }
    end
  end
end

