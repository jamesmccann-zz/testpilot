class UsersController < ApiController

  def show
    @user = current_user
  end

end
