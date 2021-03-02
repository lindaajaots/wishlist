class UsersController < ApplicationController
    def change
      create_table :users do |t|

        t.string :email,              null: false, default: ""
        t.string :encrypted_password, null: false, default: ""

        t.string :name
        t.string   :reset_password_token
        t.datetime :reset_password_sent_at

        t.datetime :remember_created_at

        t.timestamps null: false
      end

      add_index :users, :email,                unique: true
      add_index :users, :reset_password_token, unique: true
    end
  end

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Welcome to the Wishlist"
      redirect_to @user
    else
      render 'new'
    end
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: "User was deleted." }
    end
  end

private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
