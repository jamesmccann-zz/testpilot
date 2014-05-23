require 'spec_helper'

describe IconExtractor do

  context 'valid apk' do
    subject { IconExtractor.new(Rails.root.join('spec', 'fixtures', 'apks', 'test.apk')) }
    it { expect(subject.icon).to be_present }
    it { expect(subject.icon).to end_with "ic_launcher.png" }
  end

  context 'invalid apk' do
    subject { IconExtractor.new(Rails.root.join('spec', 'fixtures', 'apks', 'test_empty.apk')) }
    it { expect(subject.icon).to be_nil }
  end

end