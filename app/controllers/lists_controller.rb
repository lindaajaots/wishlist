class ListsController < ApplicationController

  # GET /lists or /lists.json
  def index
    @user = User.find_by(id: params[:user_id])
    @user_lists = @user.lists
  end


  # GET /lists/new
  def new
    @user = User.find_by(id: params[:user_id])
    @lists = List.new
  end

  # GET /lists/1/edit
  def edit
    @user = User.find_by_id(@list.user_id)
    @lists = List.find_by(id: params[:id])
  end

  def show
    @user = User.find_by(id: params[:user_id])
    @lists = List.find_by(id: params[:id])
  end

  # POST /lists or /lists.json
  def create
    @user = User.find_by(id: params[:user_id])
    @list = List.new(list_params)
    @list.user = @user
      if @wishlist.save
        redirect_to_user_list_path(@user, @list)
      else
        render 'new'
      end
    end

  # PATCH/PUT /lists/1 or /lists/1.json
  def update
    @user = User.find_by(id: params[:user_id])
    @lists = List.find_by(id: params[:id])
      if @list.update(list_params)
       redirect_to user_list_path(@user, @list)
      else
        render 'edit'
      end
    end


  # DELETE /lists/1 or /lists/1.json
  def destroy
    List.find(params[:id]).destroy
    flash[:success] = "Wishlist deleted"
    redirect_to user_lists(@current_user)
    end


  private

    def list_params
      params.require(:list).permit(:name, :notes)
    end
end
