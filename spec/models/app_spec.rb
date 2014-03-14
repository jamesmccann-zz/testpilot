require 'spec_helper'

describe App do

  describe "valid app" do
    subject do
      App.new(name: "TestApp")
    end

    it "should be a valid instance" do
      subject.should be_valid
    end

    it "should have many builds" do
      subject.should respond_to :builds
    end
  end

  describe "invalid app" do
    subject do
      App.new
    end

    it "should not be a valid instance without required attributes" do
      subject.valid?
      subject.should_not be_valid
      [:name].each do |attr|
        subject.errors[attr].should_not be_nil
      end
    end
  end

end
