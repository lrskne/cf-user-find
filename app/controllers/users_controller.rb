class UsersController < ApplicationController
  before_action :set_user, only: [:update]

  def home
    #@users = User.joins(:license).where(license.state: "WA") does not work!
    @users = User.joins(:license).where("state = 'WA'")
    end

  def index
    @users = User.all
  end

  def new
    @user = User.new
    @user.build_license
  end

  def create
    @user = User.new(user_params)
    if @user.valid?
      @user.save
      redirect_to users_path, notice: "User was sucessfully created."
     else
      render action: "new", alter: "User was not sucessfully created"
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email,
      license_attributes: [:number,  :state ])
  end

end
