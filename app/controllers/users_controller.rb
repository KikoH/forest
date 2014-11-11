class UsersController < ApplicationController
  def index
    @user = User.all
  end

  def new
  	@user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
  		redirect_to products_url, notice: "Signed up!"
  	else
  		render :new
  	end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path
  end

private
	def user_params
		params.require(:user).permit(:email, :password, :password_confirmation, :name, :age, :url)
	end	
end
