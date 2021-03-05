class WishlistsController < ApplicationController

  def index
    @wishlists = Wishlist.all
  end

  def show
    @wishlist = Wishlist.find(params[:id])
  end

  def new
    @wishlist = Wishlist.new
  end

  def edit
    @wishlist = Wishlist.find(params[:id])
  end

  def create
    @wishlist = Wishlist.new(wishlist_params)
    respond_to do |format|
    if @wishlist.save
      format.html { redirect_to @wishlist, notice: "Wishlist was successfully created." }
    else
      format.html { render :new }
    end
  end
end

  def update
    @wishlist = Wishlist.find(params[:id])
    if @wishlist.update(wishlist_params)
      redirect_to wishlists_path, notice: "Wishlist was successfully updated."
    else
      render 'edit'
    end
  end

  def destroy
    Wishlist.find(params[:id]).destroy
    flash[:success] = "Wishlist deleted"
    redirect_to wishlists_path
  end


  def toggle_thing
    @wishlist = Wishlist.find_by_id(params[:wishlist_id])
    @wishlist.toggle_thing(Thing.find_by_id(params[:thing_id]))
    redirect_to things_path
  end

  private

  def wishlist_params
    params.require(:wishlist).permit(:name, :id)
  end
end
