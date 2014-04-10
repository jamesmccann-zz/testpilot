require 'spec_helper'

describe UsersController do
  sign_in_user

  describe "GET show" do
    before do
      get :show
    end

    it { response.should render_template :show }
    it { assigns(:user).should eq controller.current_user }
    it { response.should be_ok }
  end
end
