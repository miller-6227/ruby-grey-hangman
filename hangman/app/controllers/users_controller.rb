class UsersController < ApplicationController
  
  def show
  	@user = User.find(params[:id])
  end

  def new
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)
  	@user.games = 0
  	@user.high = 0
  	if @user.save
  		flash[:success] = "Welcome to Evil Hangman!"
  		redirect_to @user
  	else
  		render 'new'
  	end
  end
  private 
  	def user_params
  		params.require(:user).permit(:name, :password, :password_confirmation)
  	end

end
