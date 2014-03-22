require 'spec_helper'

describe ApplicationHelper do

  describe '#map_flash_key_to_alert_class' do
    subject { helper.map_flash_key_to_alert_class(key) }

    context 'passthrough key' do
      let(:key) { :success }
      it { expect(subject).to eq :success }
    end

    context 'known key' do
      let(:key) { :alert }
      it { expect(subject).to eq :warning }
    end

    context 'unknown key' do
      let(:key) { :test }
      it { expect(subject).to eq :info }
    end
  end

end