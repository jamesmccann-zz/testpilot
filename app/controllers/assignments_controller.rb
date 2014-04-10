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

    if @assignment.save
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

    def assignment_params
      params.require(:assignment).permit(:email)
    end

    def find_assignment
      # Ensure that we have an app
      find_app
      @assignment ||= @app.assignments.find(params[:id])
    end

    def find_or_invite_user!
      return unless assignment_params[:email]
      @user = User.find_or_invite(assignment_params[:email])
    end

    def find_app
      @app ||= current_user.apps.find(params[:app_id])
    end

end
