class UsersController < ApplicationController

  def sign_up
    @users = User.all
  end

  def sign_up!
    user = User.new(
          name: params[:name],
          password_digest: params[:password]
        )
        if params[:password_confirmation] != params[:password]
          message = "Your passwords don't match!"
        elsif user.save
          message = "Your account has been created!"
        else
          message = "Your account couldn't be created. Did you enter a unique username and password?"
        end
        puts message
        redirect_to action: :sign_up
      flash[:notice] = message
  end

  def sign_in
  end

  def sign_in!
    user = User.find_by(name: params[:name])
    if !@user
      message = "This user doesn't exist!"
    elsif @user.password_digest != params[:password]
      message = "Your password's wrong!"
    else
      message = "You're signed in, #{@user.name}!"
    end
    puts message
    redirect_to action: :sign_in
      flash[:notice] = message
  end

  def sign_out
    puts "You're signed out!"
    redirect_to root_url
      flash[:notice] = message
  end

  def user_params
    params.fetch(:user, {}).permit(:name, :email, :password, :password_confirmation)
  end
end
