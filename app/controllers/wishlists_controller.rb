class WishlistsController < ApplicationController
  before_action :set_wishlist, only: %i[ show edit update destroy ]

  def index
    @wishlists = Wishlist.all
  end

  def show
  end

  def new
    @wishlist = Wishlist.new
  end

  def edit
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
    respond_to do |format|
      if @wishlist.update(wishlist_params)
        format.html { redirect_to @wishlist, notice: "Wishlist was successfully updated." }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @wishlist.destroy
    respond_to do |format|
      format.html { redirect_to wishlists_url, notice: "Wishlist was deleted." }
      format.json { head :no_content }
    end
  end

  private

    def set_wishlist
      @wishlist = Wishlist.find(params[:id])
    end

    def wishlist_params
      params.require(:wishlist).permit(:item)
    end
end
