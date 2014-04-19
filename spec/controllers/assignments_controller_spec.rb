require 'spec_helper'

describe AssignmentsController do
  let(:app) { build(:app, :with_assignments) }
  let(:user) { build(:user) }
  let(:assignment) { app.assignments.first }

  before do
    sign_in user
    user.stub_chain(:apps, find: app)
  end

  describe "GET index" do
    before { get :index, app_id: 1 }
    it { assigns(:assignments).should have(1).assignment }
    it { response.should be_ok }
    it { response.should render_template :index }
  end

  describe "POST create" do
    let(:app) { create(:app) }
    let(:new_user) { create(:user) }

    context "User already exists" do
      it "adds the assignment to the existing user" do
        expect {
          post :create, app_id: 1, assignment: {email: new_user.email}
          new_user.reload
        }.to change(new_user.assignments, :count).by(1)
      end
    end

    context "User does not already exist" do
      let(:uninvited_user) { attributes_for(:user) }

      it "adds the assignment to the invited user" do
        expect {
          post :create, app_id: 1, assignment: {email: uninvited_user[:email]}
        }.to change(User, :count).by(1)
      end
    end

    it "renders the created assignment" do
      post :create, app_id: 1, assignment: {email: user.email}
      response.should render_template :create
    end

    it "responds with the correct status" do
      post :create, app_id: 1, assignment: {email: user.email}
      response.status.should eq 201
    end
  end

  describe "DELETE destroy" do
    before do
      assignment.stub(destroy: true)
      app.assignments.stub(find: assignment)
    end

    it "calls destroy on the assignment" do
      assignment.should_receive(:destroy).and_return(true)
      delete :destroy, app_id: 1, id: 1
    end

    it "does not render anything" do
      delete :destroy, app_id: 1, id: 1
      # Rails mysteriously puts whitespace
      # into the response body
      response.body.strip.should be_empty
    end

    it "responds with a success status" do
      delete :destroy, app_id: 1, id: 1
      response.status.should eq 200
    end
  end

end
