class AssignmentsController < ApiController

  before_action :find_app
  before_action :find_assignment,
                only: :destroy
  before_action :find_or_invite_user!,
                only: :create

  def index
    @assignments = @app.assignments
    render
  end

  def create
    @assignment = @app.assignments.build(user: @user)

    if @assignment.save!
      render status: :created
    else
      render json: @assignment.errors, status: :not_acceptable
    end
  end

  def destroy
    @assignment.destroy
    render status: 200, nothing: true
  end


  private

    def find_assignment
      # Ensure that we have an app
      find_app
      @assignment ||= @app.assignments.find(params[:id])
    end

    def find_or_invite_user!
      @user = User.where(email: params[:email]).first ||\
              User.invite!(email: params[:email])
    end

    def find_app
      @app ||= App.find(params[:app_id])
    end

end
