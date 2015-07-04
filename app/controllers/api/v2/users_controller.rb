class Api::V2::UsersController < Api::V1::UsersController

  def show
    @user = User.find(params[:id])
  end

  def index
    users = User.all
    @users = paginate(users)
  end

end
