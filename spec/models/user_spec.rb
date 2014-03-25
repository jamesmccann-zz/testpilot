require 'spec_helper'

describe User do
  subject { build(:user) }

  it "should be valid" do
    expect(subject).to be_valid
  end

  it "should have assignments" do
    expect(User.reflect_on_association(:assignments).macro).to eq :has_many
  end

  it "should have apps" do
    expect(User.reflect_on_association(:apps).macro).to eq :has_many
  end

  it "should not be valid without an email" do
    subject.email.clear
    expect(subject).to_not be_valid
  end

  it "should not be valid without a password" do
    subject.password = nil
    subject.password_confirmation = nil
    expect(subject).to_not be_valid
  end

end
