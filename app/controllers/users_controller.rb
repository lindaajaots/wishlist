class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
  end

  def new
  end

  def edit
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: "User was deleted." }
    end
  end

end
