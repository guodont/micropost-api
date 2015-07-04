class Api::V2::UsersController < Api::V1::UsersController

  def show
    @user = User.find(params[:id])
  end

  # show users with page
  def index
    users = User.all
    @users = paginate(users)
  end

  #create new user
  def create
    if verify_params(create_params)
      @user = User.create(create_params)
      respond_to do |format|
        if @user.save
          format.json { render :create, status: :created }
        else
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end
    else
      return api_error(status: 402)
    end
  end

  private

  def create_params
    params.require(:user).permit(:name,:email,:password,:password_confirmation)
  end

  # verify params
  def verify_params(create_params)
    @user = User.find_by(name: create_params[:name]) || User.find_by(email: create_params[:email])
    if @user ==nil && create_params[:password]==create_params[:password_confirmation]
      true
    else
      false
    end
  end

end
