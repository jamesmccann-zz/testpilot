require 'spec_helper'

describe Assignment do
  subject { build(:assignment) }

  it "should be valid" do
    expect(subject).to be_valid
  end

  it "should be invalid without an app" do
    subject.app = nil
    expect(subject).to_not be_valid
  end

  it "should be invalid without a user" do
    subject.user = nil
    expect(subject).to_not be_valid
  end

  it "should be invalid without the developer flag" do
    subject.developer = nil
    expect(subject).to_not be_valid
  end

end
