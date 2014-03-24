require 'spec_helper'

describe ApplicationIconController do

  let(:app) { build(:app, :with_icon, id: 1) }
  before do
    # Stub render, otherwise Rails always tries to render
    controller.stub(render: nil)

    app.icon.store!
    App.stub(find: app)
  end

  describe "GET show" do
    it "should send the correct file" do
      expect(controller).to receive(:send_file).with(
        "#{Rails.root}/private/uploads/#{Rails.env}/app/icon/1/icon.png",
        {filename: "icon.png", type: "image/png"}
      )

      get :show, app_id: 1
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
end
