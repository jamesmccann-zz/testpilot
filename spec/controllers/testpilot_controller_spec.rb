require 'spec_helper'

describe TestpilotController do

  sign_in_user

  describe "GET show" do
    before { get :show }
    it { response.should be_ok }
    it { response.should render_template :show }
  end

end