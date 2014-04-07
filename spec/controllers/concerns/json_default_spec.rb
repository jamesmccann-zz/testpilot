require 'spec_helper'

describe JSONDefault, type: :controller do
  sign_in_user

  controller do
    include JSONDefault

    def index
      render nothing: true
    end
  end

  describe "ensure_default_format" do
    context "no format" do
      before { get :index }
      it { request.format.should eq "json" }
    end

    context "json format" do
      before { get :index, format: :json }
      it { request.format.should eq "json" }
    end

    context "unknown format" do
      before do
        controller.stub(assert_valid_format!: true)
        get :index, format: :xml
      end

      it { request.format.should eq 'xml' }
    end
  end

  describe "assert_valid_format!" do
    context "good format" do
      it { expect { get :index }.to_not raise_error }
    end
    context "bad format" do
      it { expect { get :index, format: :xml }.to raise_error(ActionController::UnknownFormat) }
    end
  end
end