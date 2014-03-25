require 'spec_helper'

describe App do
  subject(:app) { build(:app) }

  it "should be valid" do
    expect(app).to be_valid
  end

  it "should not be valid without a name" do
    app.name.clear
    expect(app).to_not be_valid
  end


  it "should have builds" do
    expect(App.reflect_on_association(:builds).macro).to eq :has_many
  end

  it "should have assignments" do
    expect(App.reflect_on_association(:assignments).macro).to eq :has_many
  end

  it "should have users" do
    expect(App.reflect_on_association(:users).macro).to eq :has_many
  end

  it "should generate a build token" do
    app.build_token.clear
    expect { app.valid? }.to change(app, :build_token)
  end

  describe ".to_param" do
    it "should parameterize the app name and ID" do
      app.id = 1
      app.name = "Test & App"
      expect(app.to_param).to eq("1-test-app")
    end
  end

  describe ".latest_build" do
    it "should return the last build" do
      app.builds.should_receive(:last)
      app.latest_build
    end
  end

  describe ".regenerate_build_token!" do
    it "should update the build token attribute with a long string" do
      app.should_receive(:update!) do |options|
        options[:build_token].should be_a(String)
        options[:build_token].length.should be App.build_token_length
      end

      app.regenerate_build_token!
    end
  end
end
