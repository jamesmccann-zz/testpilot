require 'spec_helper'

describe Build do
  subject do
    Build.new
  end

  describe "valid build" do
    subject do
      Build.new(:app => App.new(name: "TestApp"), 
                :apk => File.open(File.join(Rails.root, '/spec/fixtures/apks/test.apk')))
    end

    it "should be a valid instance" do
      subject.should be_valid
    end
  end

  describe "invalid build" do
    subject do
      Build.new
    end

    it "should not be a valid instance without the required fields" do
      subject.should_not be_valid
      [:number, :apk, :app].each do |attr|
        subject.errors[attr].should_not be_nil
      end
    end
  end

  describe "build number" do
    subject do
      Build.new(:app => App.new(name: "TestApp"), 
                :apk => File.open(File.join(Rails.root, '/spec/fixtures/apks/test.apk')))
    end

    it "should set build number before validation" do
      subject.valid?
      subject.number.should equal(1)
    end
  end

end
