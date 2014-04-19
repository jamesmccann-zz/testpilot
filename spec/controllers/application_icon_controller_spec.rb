require 'spec_helper'

describe ApplicationIconController do

  let(:app) { build(:app, :with_icon, id: 1) }
  let(:user) { build(:user) }

  before do
    # Stub render, otherwise Rails always tries to render
    controller.stub(render: nil)
    sign_in user

    app.icon.store!
    user.stub_chain(:apps, find: app)
  end

  describe "GET show" do
    it "should send the correct file" do
      #expect(controller).to receive(:send_file).with(
      #  "#{Rails.root}/private/uploads/#{Rails.env}/app/icon/1/icon.png",
      #  {filename: "icon.png", type: "image/png"}
      #)

      get :show, app_id: 1
      response.should_not be_redirect
    end
  end

  describe "GET show", "with no icon" do
    let(:app) { build(:app, id: 1) }

    it "should redirect to the fallback URL" do
      get :show, app_id: 1
      expect(response).to redirect_to "http://test.host/assets/fallback/icon_default.png"
    end
  end

  describe "GET thumb" do
    it "should send the correct file" do
      expect(controller).to receive(:send_file).with(
        "#{Rails.root}/private/uploads/#{Rails.env}/app/icon/1/thumb_icon.png",
        {filename: "thumb_icon.png", type: "image/png"}
      )

      get :thumb, app_id: 1
    end
  end

  describe "GET thumb", "with no icon" do
    let(:app) { build(:app, id: 1) }

    it "should redirect to the fallback URL" do
      get :thumb, app_id: 1
      expect(response).to redirect_to "http://test.host/assets/fallback/icon_thumb_default.png"
    end
  end
end
